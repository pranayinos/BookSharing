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
        let params = ["username" : userDetails.username, "password" : userDetails.password]
        Alamofire.request(BookSharingAPIURL.AUTHENTICATE_LOGIN, method: .post, parameters: params, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"]).responseJSON{ (response) -> Void in
            
            var loginResponse:LoginResponse? = nil
            
            guard response.result.isSuccess else {
                print("Error while logging in: \(response.result.error!)")
                completion(nil)
                return
            }
            
            let JSONvalue = JSON(response.result.value!)
            
            guard JSONvalue != nil, JSONvalue["status"] != nil else {
                print("Malformed data received from login API \(JSONvalue.rawString()!)")
                completion(nil)
                return
            }
            
            guard JSONvalue["status"].rawString() == "true" else{
                let status = JSONvalue["status"]
                let message = JSONvalue["message"]
                let error = JSONvalue["error"]
                let loginResponseComponent = LoginResponseFailure(status: status.rawString()!, message: message.rawString()!, error: error.rawString())
                print("Connection succeded but server returned error, message: \(loginResponseComponent.message)")
                loginResponse = LoginResponse.Failure(loginResponseComponent)
                completion(loginResponse)
                return
            }
            
            let loginResponseComponent = LoginResponseSuccess(status: JSONvalue["status"].rawString()!, message: JSONvalue["message"].rawString()!, data: JSONvalue["data"].rawString()!)
            
            loginResponse = LoginResponse.Success(loginResponseComponent)
            
            completion(loginResponse)
            
            return
        }
    }

}
