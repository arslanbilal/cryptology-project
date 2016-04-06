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
    var generateadNumber: UInt32 = 0
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.signInButton.addTarget(self, action: #selector(LoginViewController.didTapSignInButton(_:)), forControlEvents: .TouchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(LoginViewController.didTapSignUpButton(_:)), forControlEvents: .TouchUpInside)
        loginView.logButton.addTarget(self, action: #selector(LoginViewController.didTapLogButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
        
        loginView.autoPinEdgesToSuperviewEdges()
    }
    
    // MARK: - Random Number Generator
    func generateRandomNumber() {
        generateadNumber = (10000 + arc4random_uniform(90000))
        loginView.generatedCodeLabel.text = "\(generateadNumber)"
    }
    
    // MARK: - Button Actions
    func didTapSignInButton(sender: UIButton) {
        let username = loginView.usernameTextField.text!
        let password = loginView.passwordTextField.text!
        let inputCode = loginView.generatedCodeTextField.text!
        
        if  username != "" && password != "" && inputCode != "" {
            if generateadNumber == UInt32(inputCode) {
                let user = realm.objects(RealmUser).filter("username = '\(username)' AND password = '\(password)'").first
                if user != nil {
                    ActiveUser.sharedInstance.setActiveUser(user!)
                    loginView.usernameTextField.text = ""
                    loginView.passwordTextField.text = ""
                    
                    self.presentViewController(NavigationController(rootViewController: MessagesListViewController()), animated: true, completion: nil)
                } else {
                    self.initAndShowAletView("Login Error", message: "Could not entring the App.\n'username' or 'password' is wrong.", style: .Alert)
                }
            } else {
                self.initAndShowAletView("Login Error", message: "Enterred Code is not equal the Generated Code", style: .Alert)
            }
        } else {
            self.initAndShowAletView("Login Error", message: "Please fill the all missing fileds.", style: .Alert)
        }
        
        loginView.passwordTextField.text = ""
        loginView.generatedCodeTextField.text = ""
        self.generateRandomNumber()
    }
    
    func didTapSignUpButton(sender: UIBarButtonItem) {
        //! Sign up process is not possible in this version.
    }
    
    func didTapLogButton(sender :UIBarButtonItem) {
        self.presentViewController(NavigationController(rootViewController: ManInTheMiddleTableViewController()), animated: true, completion: nil)
    }
    
    // MARK: - AlertViewInitialise
    func initAndShowAletView(title: String, message: String, style: UIAlertControllerStyle) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
