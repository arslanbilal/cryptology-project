//
//  LoginController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let loginView = LoginView(frame: CGRectZero)
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.usernameTextField.delegate = self
        loginView.passwordTextField.delegate = self
        loginView.loginButton.addTarget(self, action: "didTapLoginButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
        
        loginView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: Button Actions
    func didTapLoginButton(sender: UIButton) {
        let username = loginView.usernameTextField.text!
        let password = loginView.passwordTextField.text!
        
        if  username != "" && password != "" {
            let user = realm.objects(User).filter("username = '\(username)' AND password = '\(password)'").first
            
            if user != nil {
                ActiveUser.sharedInstance.setUser(user!)
                
                loginView.usernameTextField.text = ""
                loginView.passwordTextField.text = ""
                
                self.presentViewController(NavigationController(rootViewController: MessagesListTableViewController()), animated: true, completion: nil)
            } else {
                print("Couldn't find!")
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
