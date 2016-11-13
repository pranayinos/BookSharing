//
//  File.swift
//  BookSharing
//
//  Created by Pranay Kumar on 16/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JsonConverter {
    func convert(in:String) -> [String: Any]
}

//class SwiftyJsonConverter: JsonConverter {
//    func convert(in: NSData) -> [String : Any] {
//        return JSON(data: in)
//    }
//}
