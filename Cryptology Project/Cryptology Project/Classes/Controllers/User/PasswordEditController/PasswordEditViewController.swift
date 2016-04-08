//
//  PasswordEditViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class PasswordEditViewController: UIViewController, UITextFieldDelegate {

    let passwordTextField = UITextField.newAutoLayoutView()
    let password2TextField = UITextField.newAutoLayoutView()
    let submitButton = UIButton.newAutoLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Change Password"
        
        self.loadViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadViews() {
        let loginElementsView = UIView.newAutoLayoutView()
        loginElementsView.backgroundColor = UIColor.loginViewBackgroundColor()
        loginElementsView.layer.cornerRadius = 10.0
        self.view.addSubview(loginElementsView)
        
        loginElementsView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(30.0, 15.5, 0, 15.5), excludingEdge: .Bottom)
        loginElementsView.autoSetDimension(.Height, toSize: 190)
        
        
        let passwordView = UIView.newAutoLayoutView()
        passwordView.backgroundColor = UIColor.whiteColor()
        passwordView.layer.cornerRadius = 5.0
        loginElementsView.addSubview(passwordView)
        
        passwordView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 0, 10.0), excludingEdge: .Bottom)
        passwordView.autoSetDimension(.Height, toSize: 50)
        
        
        passwordTextField.delegate = self
        passwordTextField.textAlignment = .Center
        passwordTextField.secureTextEntry = true
        passwordTextField.placeholder = "password"
        passwordView.addSubview(passwordTextField)
        
        passwordTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        let password2View = UIView.newAutoLayoutView()
        password2View.backgroundColor = UIColor.whiteColor()
        password2View.layer.cornerRadius = 5.0
        loginElementsView.addSubview(password2View)
        
        password2View.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        password2View.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        password2View.autoPinEdge(.Top, toEdge: .Bottom, ofView: passwordView, withOffset: 10.0)
        password2View.autoSetDimension(.Height, toSize: 50)
        
        
        password2TextField.delegate = self
        password2TextField.textAlignment = .Center
        password2TextField.secureTextEntry = true
        password2TextField.placeholder = "retype password"
        password2View.addSubview(password2TextField)
        
        password2TextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        submitButton.backgroundColor = UIColor.incomingMessageColor()
        submitButton.titleLabel?.textColor = UIColor.whiteColor()
        submitButton.setTitle("Change Password", forState: .Normal)
        submitButton.addTarget(self, action: #selector(PasswordEditViewController.didTapSubmitButton(_:)), forControlEvents: .TouchUpInside)
        submitButton.layer.cornerRadius = 5.0
        loginElementsView.addSubview(submitButton)
        
        submitButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: password2View, withOffset: 10.0)
        submitButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 10.0, 10.0, 10.0), excludingEdge: .Top)
        //submitButton.autoSetDimension(.Height, toSize: 50)
    }
    
    // MARK: - Button Action
    func didTapSubmitButton(sender: UIButton) {
        
        let password1 = passwordTextField.text!
        let password2 = password2TextField.text!
        
        if password1 != "" && password2 != ""  {
            if password1 == password2 {
                if password1.length > 7 {
                    ActiveUser.sharedInstance.user.changePassword(password1)
                    
                    passwordTextField.text = ""
                    passwordTextField.resignFirstResponder()
                    password2TextField.text = ""
                    password2TextField.resignFirstResponder()
                    
                    showAlertView("Password Changed!", message: "", style: .Alert)
                    
                } else {
                    showAlertView("Cannot Change", message: "Enter more than 8 chracter.", style: .Alert)
                }
            } else {
                showAlertView("Match Error", message: "Passwords you enter does not match.", style: .Alert)
            }
        } else {
            showAlertView("Error!", message: "Fill the password fields.", style: .Alert)
        }
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: - AlertViewInitialise
    func showAlertView(title: String, message: String, style: UIAlertControllerStyle) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
