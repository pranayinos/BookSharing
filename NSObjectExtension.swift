//
//  NSObjectExtension.swift
//  BookSharing
//
//  Created by Pranay Kumar on 16/11/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
