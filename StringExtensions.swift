//
//  StringExtensions.swift
//  AppX
//
//  Created by Pranay Kumar on 04/07/16.
//  Copyright © 2016 Pranay Kumar. All rights reserved.
//

import Foundation

extension String{
    
    var length: Int { return characters.count    }
    
    var isNotBlank: Bool{
        get{
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return !trimmed.isEmpty
        }
    }
    
   
    
    var isAlphanumeric: Bool{
        let alphabetSet = CharacterSet.letters
        let numberSet = CharacterSet.decimalDigits
        let doesContainAlphabets = self.rangeOfCharacter(from: alphabetSet)
        let doesContainNumbers = self.rangeOfCharacter(from: numberSet)
        
        if doesContainAlphabets != nil && doesContainNumbers != nil {
            return true
        }else{
            return false
        }
    }
    
    var doesContainOnlyAlphabets: Bool{
        let alphabetSet = CharacterSet.letters
        let doesContainAlphabets = self.rangeOfCharacter(from: alphabetSet)
    
        if doesContainAlphabets != nil{
            return true
        }else{
            return false
        }

    }
    
    static func getEmptyString() -> String{
        return ""
    }
}
