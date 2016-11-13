//
//  AFLogin.swift
//  BookSharing
//
//  Created by Pranay Kumar on 22/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AFLogin {
    func login(userDetails: LoginRequest, completion: @escaping (LoginResponse?) -> Void){
        Alamofire.request(BookSharingAPIURL.AUTHENTICATE_LOGIN, method: .post, parameters: nil, encoding: URLEncoding.default, headers: ["'Content-Type": "application/json"]).validate().responseJSON{ (response) -> Void in
            
            var loginResponse:LoginResponse? = nil
            
            guard response.result.isSuccess else {
                print("Error while logging in: \(response.result.error)")
                completion(nil)
                return
            }
            
            let JSONvalue = JSON(response.result.value!)
            
            guard JSONvalue != nil, JSONvalue["status"].string != nil else {
                print("Malformed data received from login API")
                completion(nil)
                return
            }
            
            guard let status = JSONvalue["status"].string , status == "true" else{
                let loginResponseComponent : LoginResponseFailure = LoginResponseFailure(status: JSONvalue["status"].string!, message: JSONvalue["message"].string!, error: JSONvalue["error"].string)
                print("Connection succeded but server returned error, message: \(loginResponseComponent.message)")
                loginResponse = LoginResponse.Failure(loginResponseComponent)
                completion(loginResponse)
                return
            }
            
            let loginResponseComponent = LoginResponseSuccess(status: JSONvalue["status"].string!, message: JSONvalue["message"].string!, data: JSONvalue["data"].string!)
            
            loginResponse = LoginResponse.Success(loginResponseComponent)
            
            completion(loginResponse)
            
            return
        }
    }

}
