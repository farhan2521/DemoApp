//
//  LoginViewController.swift
//  Demo App
//
//  Created by Mohammad Farhan on 13/12/21.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotPassLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    let loginUserDetails = UserDetailsRepo.singletonUserDetailsRepo
    let alertBox = AlertViewController()
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotLabelGesture()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initialViewChanges()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        loginButtonClickHandler()
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
    
    @objc
    func forgotLabelTapFunc(sender:UITapGestureRecognizer) {
        let resetVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.Ids.resetVC) as! ResetPassViewController
        resetVC.username = usernameTF.text
        self.navigationController?.pushViewController(resetVC, animated: true)
    }
    
    // Action on login button press
    func loginButtonClickHandler() {
        if usernameTF.text == "" {
            showSnackbar(text: Constants.StringValues.usernameReqd)
        }
        else if passwordTF.isHidden{
            if isValid(){
                if loginUserDetails.defaults.array(forKey: Constants.Ids.userData) != nil && loginUserDetails.searchRepo(name: usernameTF.text!){
                    passwordTF.isHidden = false
                    forgotPassLabel.isHidden = false
                    loginButton.setTitle(Constants.StringValues.textLogin, for: UIControl.State.normal)
                }
                else {
                    showSnackbar(text: Constants.StringValues.userNotExist)
                    let registerVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.Ids.registerVC) as! RegisterViewController
                    registerVC.username = usernameTF.text
                    self.navigationController?.pushViewController(registerVC, animated: true)
                }
            } else {
                showSnackbar(text: Constants.StringValues.usernameCondition)
            }
        }
        else if passwordTF.text == ""{
            showSnackbar(text: Constants.StringValues.passReqd)
        }
        else if isValid() && loginUserDetails.searchRepo(name: usernameTF.text!){
            if passwordTF.text! == loginUserDetails.checkPassword(username: usernameTF.text!){
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.Ids.homeVC) as! HomeViewController
                self.navigationController?.pushViewController(homeVC, animated: true)
            } else {
                showSnackbar(text: Constants.StringValues.passWrong)
            }
        }
        else {
            showSnackbar(text: Constants.StringValues.usernameCondition)
        }
    }
    
    // Validation function for username
    func isValid() -> Bool{
        let valid = self.validation.validateUsername(username: usernameTF.text!)
        return valid
    }
    
    // Gesture recognizer for forgot password label
    func forgotLabelGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.forgotLabelTapFunc))
        forgotPassLabel.addGestureRecognizer(tap)
    }
    
    // Initial UI changes when view appears
    func initialViewChanges() {
            passwordTF.isHidden = true
            forgotPassLabel.isHidden = true
            loginButton.setTitle(Constants.StringValues.textLoginReg, for: UIControl.State.normal)
    }
    
}
