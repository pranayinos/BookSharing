//
//  NetworkingUtility.swift
//  BookSharing
//
//  Created by Pranay Kumar on 16/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol AppNetworking{
    func sendHttpGet(url: String) throws -> [String:Any]
    func sendHttpGet(url: String, headers: [String : String]) throws -> [String:Any]
    func sendHttpPost(url: String, data: JSON) throws -> [String:Any]
    func sendHttpPost(url: String, data: JSON, headears: [String : String]) throws -> [String:Any]
}

//class AFAppNetworking: AppNetworking{
//    internal func sendHttpGet(url: String, headers: [String : String]) throws -> [String : Any] {
//        
//    }
//
//    internal func sendHttpPost(url: String, data: JSON, headears: [String : String]) throws -> [String : Any] {
//        <#code#>
//    }
//
//    internal func sendHttpPost(url: String, data: JSON) throws -> [String : Any] {
//        <#code#>
//    }
//
//    internal func sendHttpGet(url: String, completionHandler: @escaping (DataResponse<Any>) -> Void) throws -> [String : Any] {
//        Alamofire.request(url).responseJSON(completionHandler: completionHandler)
//    }
//
//    
//}
