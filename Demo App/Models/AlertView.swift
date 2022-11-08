//
//  AlertView.swift
//  Demo App
//
//  Created by Mohammad Farhan on 14/12/21.
//

import UIKit

struct AlertViewController {
    func alertView (vc:UIViewController, titleText: String, messageText: String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func alertViewAction (vc:UIViewController, titleText: String, messageText: String, action: UIAlertAction) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
