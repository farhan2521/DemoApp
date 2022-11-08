//
//  RegisterViewController.swift
//  Demo App
//
//  Created by Mohammad Farhan on 14/12/21.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var usernameRegTF: UITextField!
    @IBOutlet weak var passwordRegTF: UITextField!
    @IBOutlet weak var repeatPasswordRegTF: UITextField!
    
    let regUserDetails = UserDetailsRepo.singletonUserDetailsRepo
    var username: String?
    var userData: [[String:String]] = []
    let alertBox = AlertViewController()
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameRegTF.text = username
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        registerButtonClickHandler()
    }
    
    // Validation function for username
    func isValidUsername() -> Bool {
        let valid = self.validation.validateUsername(username: usernameRegTF.text!)
        return valid
    }
    
    // Validation function for password
    func isValidPassword() -> Bool {
        let valid = self.validation.validatePassword(password: passwordRegTF.text!)
        return valid
    }
    
    // Action on register button press
    func registerButtonClickHandler() {
        if usernameRegTF.text == "" || passwordRegTF.text == "" || repeatPasswordRegTF.text == "" {
            showSnackbar(text: Constants.StringValues.allFieldsMand)
        }
        else if !isValidUsername() {
            showSnackbar(text: Constants.StringValues.usernameCondition)
        }
        else if !isValidPassword() {
            showSnackbar(text: Constants.StringValues.passCondition)
        }
        else if passwordRegTF.text != repeatPasswordRegTF.text {
            showSnackbar(text: Constants.StringValues.passMismatch)
        }
        else if regUserDetails.defaults.array(forKey: Constants.Ids.userData) != nil {
            if !regUserDetails.searchRepo(name: usernameRegTF.text!) {
                userData = regUserDetails.defaults.array(forKey: Constants.Ids.userData) as! [[String: String]]
                userData.append([Constants.Ids.name: usernameRegTF.text!, Constants.Ids.password: passwordRegTF.text!])
                regUserDetails.defaults.set(userData, forKey: Constants.Ids.userData)
                showSnackbar(text: Constants.StringValues.regSuccess, duration: .forever, isSuccess: true, viewController: self)
            }
            else {
                showSnackbar(text: Constants.StringValues.usernameExists)
            }
        }
        else {
            userData.append([Constants.Ids.name: usernameRegTF.text!, Constants.Ids.password: passwordRegTF.text!])
            regUserDetails.defaults.set(userData, forKey: Constants.Ids.userData)
            showSnackbar(text: Constants.StringValues.regSuccess, duration: .forever, isSuccess: true, viewController: self)
        }
    }
    
}
