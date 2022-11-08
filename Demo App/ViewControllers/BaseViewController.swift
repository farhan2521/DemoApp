//
//  BaseViewController.swift
//  Demo App
//
//  Created by Mohammad Farhan on 12/01/22.
//

import UIKit
import TTGSnackbar

class BaseViewController: UIViewController {
    
    var presentedSnackbar = TTGSnackbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Method to show snackbar
    func showSnackbar(text: String, duration : TTGSnackbarDuration = .long, isSuccess: Bool = false, viewController: UIViewController? = nil) {
        presentedSnackbar.dismiss()
        let snackbar = TTGSnackbar(message: text, duration: duration)
        
        if !isSuccess {
            // Image icon
            snackbar.icon = UIImage(named: Constants.Ids.errorIcon)
            
            // Background color
            snackbar.backgroundColor = UIColor(named: Constants.Ids.snackbarNegative)
            
            // Action icon
            snackbar.actionIcon = UIImage(named: Constants.Ids.crossIcon)
            snackbar.actionBlock = { (snackbar) in
                snackbar.dismiss()
            }
            
        } else {
            // Image icon
            snackbar.icon = UIImage(named: Constants.Ids.smileIcon)
                
            // Background color
            snackbar.backgroundColor = UIColor(named: Constants.Ids.snackbarPositive)
            
            // Action text
            snackbar.actionText = Constants.StringValues.snackLogin
            snackbar.actionBlock = { (snackbar) in
                snackbar.dismiss()
                viewController?.navigationController?.popViewController(animated: true)
            }
        }
        
        // Corner radius
        snackbar.cornerRadius = 7
        
        // Animation
        snackbar.animationType = .slideFromLeftToRight
        
        // Gesture recognizer callbacks
        snackbar.onSwipeBlock = { (snackbar, direction) in
            // Animation type to simulate being dismissed in that direction
            switch direction {
            case .right:
                snackbar.animationType = .slideFromLeftToRight
            case .left:
                snackbar.animationType = .slideFromRightToLeft
            case .up:
                snackbar.animationType = .slideFromBottomToTop
            case .down:
                snackbar.animationType = .slideFromTopToBottom
            default:
                return
            }
            snackbar.dismiss()
            if isSuccess {
                viewController?.navigationController?.popViewController(animated: true)
            }
        }
        
        presentedSnackbar = snackbar
        snackbar.show()
    }
    
    // Hide keyboard method when tapped around
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // Dismiss keyboard function
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
