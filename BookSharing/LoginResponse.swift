//
//  LoginResponse.swift
//  BookSharing
//
//  Created by Pranay Kumar on 22/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LoginResponseSuccess {
    let status: String
    let message: String
    let data: String
    
    init(status: String, message: String, data: String) {
        self.data = data
        self.message = message
        self.status = status
    }
}

struct LoginResponseFailure {
    let status: String
    let message: String
    let error: String?
    
    init(status: String, message: String, error: String?) {
        self.error = error
        self.message = message
        self.status = status
    }
}

enum LoginResponse{
    case Success(LoginResponseSuccess)
    case Failure(LoginResponseFailure)
}

