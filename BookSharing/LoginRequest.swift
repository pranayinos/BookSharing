//
//  LoginRequest.swift
//  BookSharing
//
//  Created by Pranay Kumar on 17/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LoginRequest {
    let username: String
    let password: String
    
    init(username: String,password: String){
        self.username = username
        self.password = password
    }
    
    func toJSON() -> Dictionary<String, AnyObject> {
        return [
            "username": self.password as AnyObject,
            "password": self.password as AnyObject
        ]
    }
}
