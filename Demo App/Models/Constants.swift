//
//  Constants.swift
//  Demo App
//
//  Created by Mohammad Farhan on 17/01/22.
//

struct Constants {
    struct Ids {
        // Identifiers
        static let errorIcon = "error_icon"
        static let smileIcon = "smile_icon"
        static let crossIcon = "cross"
        static let snackbarPositive = "SnackbarPositive"
        static let snackbarNegative = "SnackbarNegative"
        static let userData = "userData"
        static let name = "name"
        static let password = "password"
        static let reusableCell = "ReusableCell"
        static let registerVC = "RegisterViewController"
        static let resetVC = "ResetPassViewController"
        static let homeVC = "HomeViewController"
    }
    
    struct StringValues {
        // Common string values
        static let snackLogin = "Login!"
        static let textLogin = "Login"
        static let textLoginReg = "Login/Register"
        static let usernameReqd = "Username required."
        static let userNotExist = "Username does not exist, please register."
        static let usernameCondition = "Username should consist alphabets only."
        static let passReqd = "Password required."
        static let passWrong = "Wrong Password."
        static let usernameError = "1. Username does not exist (or)\n2. Make sure username contains alphabets only."
        static let allFieldsMand = "All fields are mandatory."
        static let passCondition = "Password should be of minimum 8 characters consisting alphabets and numbers only."
        static let passMismatch = "Password mismatch."
        static let usernameExists = "Username already exists."
        static let regSuccess = "Registered successfully"
        static let passResetSuccess = "Password reset successful"
        static let countryAPIURL = "https://jsonplaceholder.typicode.com/comments"
    }
    
    struct RegexStrings {
        // Regex codes
        static let usernameRegex = "^[A-Za-z]+$"
        static let passwordRegex = "^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]{8,12})$"
    }
}
