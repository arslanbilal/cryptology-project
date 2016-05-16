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
    var generateadCaptcha: String = ""
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.signInButton.addTarget(self, action: #selector(didTapSignInButton(_:)), forControlEvents: .TouchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(didTapSignUpButton(_:)), forControlEvents: .TouchUpInside)
        loginView.logButton.addTarget(self, action: #selector(didTapLogButton(_:)), forControlEvents: .TouchUpInside)
        loginView.steganographerButton.addTarget(self, action: #selector(didTapSteganographerButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
        
        loginView.autoPinEdgesToSuperviewEdges()
        self.generateRandomNumber()
    }
    
    // MARK: - Random Number Generator
    func generateRandomNumber() {
        generateadCaptcha = CaptchaGenerator.generate()
        loginView.generatedCodeLabel.text = generateadCaptcha
    }
    
    // MARK: - Button Actions
    func didTapSignInButton(sender: UIButton) {
        let user = realm.objects(RealmUser).filter("username = 'user1'").first
        ActiveUser.sharedInstance.setActiveUser(user!)
        self.presentViewController(TabBarController(), animated: true, completion: nil)
        
        //        let username = loginView.usernameTextField.text!
        //        let password = loginView.passwordTextField.text!
        //        let inputCode = loginView.generatedCodeTextField.text!
        //        
        //        if  username != "" && password != "" && inputCode != "" {
        //            if generateadCaptcha == inputCode {
        //                let user = realm.objects(RealmUser).filter("username = '\(username)'").first
        //                
        //                if user != nil {
        //                    if !(user!.isLocked) {
        //                        if user!.attemptableDate.timeIntervalSince1970 < NSDate().timeIntervalSince1970 {
        //                            if user!.checkPassword(password) {
        //                                ActiveUser.sharedInstance.setActiveUser(user!)
        //                                loginView.usernameTextField.text = ""
        //                                loginView.passwordTextField.text = ""
        //                                
        //                                try! realm.write {
        //                                    user!.wrongAttemptCount = 0
        //                                    user!.attemptableDate = NSDate()
        //                                }
        //                                
        //                                self.presentViewController(TabBarController(), animated: true, completion: nil)
        //                            } else {
        //                                let wrongAttemptCount = user!.wrongAttemptCount + 1
        //                                
        //                                if wrongAttemptCount == 3 {
        //                                    let date = NSDate.init(timeIntervalSinceNow: 60 * 30) // 30 min delay
        //                                    try! realm.write {
        //                                        user!.attemptableDate =  date// 20 sec
        //                                        user!.wrongAttemptCount = wrongAttemptCount
        //                                    }
        //                                
        //                                    showAlertView("Wrong Password!", message: "Account's login is delayed. You must try at date: \(Helper.getStringDateFromDate(date))", style: .Alert)
        //                                } else if wrongAttemptCount >= 5 {
        //                                    try! realm.write {
        //                                        user!.isLocked = true
        //                                        user!.wrongAttemptCount = 5
        //                                    }
        //                                    
        //                                    showAlertView("Important Error!", message: "User is Locked! You can not login anymore! Please contact the customer service.", style: .Alert)
        //                                } else {
        //                                    try! realm.write {
        //                                        user!.wrongAttemptCount = wrongAttemptCount
        //                                    }
        //                                    
        //                                    showAlertView("Wrong Pssword!", message: "\(user!.username) password does not match!", style: .Alert)
        //                                }
        //                            }
        //                            
        //                        } else {
        //                            showAlertView("Login Error!", message: "Login is delayed to date: \(Helper.getStringDateFromDate(user!.attemptableDate)). Try after this date.", style: .Alert)
        //                        }
        //                    } else {
        //                        showAlertView("Login Error\nUser is Locked", message: "You can not sign in because user is locked with multiple wrong attempt. Please contact the customer service.", style: .Alert)
        //                    }
        //                } else {
        //                    showAlertView("Login Error", message: "Could not entring the App.\n'username' or 'password' is wrong.", style: .Alert)
        //                }
        //            } else {
        //                showAlertView("Login Error", message: "Enterred Code is not equal the Generated Code", style: .Alert)
        //            }
        //        } else {
        //            showAlertView("Login Error", message: "Please fill the all missing fileds.", style: .Alert)
        //        }
        //        
        //        loginView.passwordTextField.text = ""
        //        loginView.generatedCodeTextField.text = ""
        //        generateRandomNumber()
    }
    
    func didTapSignUpButton(sender: UIBarButtonItem) {
        //! Sign up process is not possible in this version.
        //generateRandomNumber()
    }
    
    func didTapLogButton(sender :UIBarButtonItem) {
        let manInTheMiddleTableViewController = ManInTheMiddleTableViewController()
        manInTheMiddleTableViewController.exitButton = true
        self.presentViewController(NavigationController(rootViewController: manInTheMiddleTableViewController), animated: true, completion: nil)
    }
    
    func didTapSteganographerButton(sender :UIBarButtonItem) {
        let steganographerViewController = SteganographerViewController()
        steganographerViewController.exitButton = true
        self.presentViewController(NavigationController(rootViewController: steganographerViewController), animated: true, completion: nil)
    }
    
    // MARK: - AlertViewInitialise
    func showAlertView(title: String, message: String, style: UIAlertControllerStyle) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
