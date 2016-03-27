//
//  LoginController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class LoginViewController: UIViewController {
    
    let loginView = LoginView(frame: CGRectZero)
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.loginButton.addTarget(self, action: #selector(LoginViewController.didTapLoginButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
        
        loginView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: Button Actions
    func didTapLoginButton(sender: UIButton) {
        let username = loginView.usernameTextField.text!
        let password = loginView.passwordTextField.text!
        
        if  username != "" && password != "" {
            let user = realm.objects(RealmUser).filter("username = '\(username)' AND password = '\(password)'").first
            
            if user != nil {
                ActiveUser.sharedInstance.setUser(user!)
                
                loginView.usernameTextField.text = ""
                loginView.passwordTextField.text = ""
                
                self.presentViewController(NavigationController(rootViewController: MessagesListTableViewController()), animated: true, completion: nil)
            } else {
                let alertController = UIAlertController.init(title: "Login Error", message: "Could not entring the App.\n'username' or 'password' is wrong.", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController.init(title: "Login Error", message: "Please fill the all missing fileds.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}
