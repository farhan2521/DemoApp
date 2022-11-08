//
//  ResetPassViewController.swift
//  Demo App
//
//  Created by Mohammad Farhan on 14/12/21.
//

import UIKit

class ResetPassViewController: BaseViewController {
    
    @IBOutlet weak var usernameResetTF: UITextField!
    @IBOutlet weak var passwordResetTF: UITextField!
    @IBOutlet weak var repeatPasswordResetTF: UITextField!
    
    let resetUserDetails = UserDetailsRepo.singletonUserDetailsRepo
    var username: String?
    var userData: [[String:String]] = []
    let alertBox = AlertViewController()
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameResetTF.text = username
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func resetPasswordPressed(_ sender: UIButton) {
        resetPassButtonClickhandler()
    }
    
    // Validation function for password
    func isValidPassword() -> Bool {
        let valid = self.validation.validatePassword(password: passwordResetTF.text!)
        return valid
    }
    
    // Action on reset button press
    func resetPassButtonClickhandler() {
        if usernameResetTF.text == "" || passwordResetTF.text == "" || repeatPasswordResetTF.text == "" {
            showSnackbar(text: Constants.StringValues.allFieldsMand)
        }
        else if !isValidPassword() {
            showSnackbar(text: Constants.StringValues.passCondition)
        }
        else if passwordResetTF.text != repeatPasswordResetTF.text {
            showSnackbar(text: Constants.StringValues.passMismatch)
        }
        else {
            if resetUserDetails.searchRepo(name: usernameResetTF.text!) {
                resetUserDetails.resetPassword(name: usernameResetTF.text!, password: passwordResetTF.text!)
                showSnackbar(text: Constants.StringValues.passResetSuccess, duration: .forever, isSuccess: true, viewController: self)
            }
            else {
                showSnackbar(text: Constants.StringValues.userNotExist)
            }
        }
    }
    
}
