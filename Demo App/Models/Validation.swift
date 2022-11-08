//
//  Validation.swift
//  Demo App
//
//  Created by Mohammad Farhan on 22/12/21.
//

import Foundation

class Validation {
    
    // Validate username method
    func validateUsername(username: String) -> Bool {
        let isValidateName = username.range(of: Constants.RegexStrings.usernameRegex, options: .regularExpression) != nil
        return isValidateName
    }
    
    // Validate password method
    func validatePassword(password: String) -> Bool {
        let isvalidatePass = password.range(of: Constants.RegexStrings.passwordRegex, options: .regularExpression) != nil
        return isvalidatePass
    }
}
