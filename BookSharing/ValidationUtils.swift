
//
//  ValidationUtils.swift
//  BookSharing
//
//  Created by Pranay Kumar on 11/10/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation

func isvalidPassword(input : String?) -> Bool{
    guard let passordToValidate = input else{
        return false
    }
    let doesContainAlphabets = passordToValidate.rangeOfCharacter(from: NSCharacterSet.letters)
    let doesContainNumbers = passordToValidate.rangeOfCharacter(from: NSCharacterSet.decimalDigits)
    
    if doesContainAlphabets != nil && doesContainNumbers != nil && passordToValidate.length >= Constants.MIN_PASSWORD_LENGTH{
        return true
    }else{
        return false
    }
}

func isValidEmail(input : String?) -> Bool {
    if input == nil {
        return false
    }
    do {
        let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: input!, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input!.characters.count)) != nil
    } catch {
        return false
    }
}
