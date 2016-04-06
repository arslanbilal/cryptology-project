//
//  LoginView.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 14/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class LoginView: UIView, UITextFieldDelegate {
    
    let usernameTextField = UITextField.newAutoLayoutView()
    let passwordTextField = UITextField.newAutoLayoutView()
    let signInButton = UIButton.newAutoLayoutView()
    let signUpButton = UIButton.newAutoLayoutView()
    let generatedCodeLabel = UILabel.newAutoLayoutView()
    let generatedCodeTextField = UITextField.newAutoLayoutView()
    let logButton = UIButton.newAutoLayoutView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.loginViewBackgroundColor()
        
        let generatedCodeViewWidth = UIScreen.mainScreen().bounds.width - 55
        let appnameLabelYPoint = ((UIScreen.mainScreen().bounds.height / 2.0) - 135) / 2.0
        
        
        let appNameLabel = UILabel.newAutoLayoutView()
        appNameLabel.textAlignment = .Center
        appNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 45.0)
        appNameLabel.adjustsFontSizeToFitWidth = true;
        appNameLabel.numberOfLines = 1
        appNameLabel.textColor = UIColor.whiteColor()
        appNameLabel.text = "CryptoChat"
        self.addSubview(appNameLabel)
        
        appNameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(appnameLabelYPoint, 15.0, 0, 15.0), excludingEdge: .Bottom)
        appNameLabel.autoSetDimension(.Height, toSize: 60)
        
        
        let loginElementsView = UIView.newAutoLayoutView()
        loginElementsView.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.3)
        loginElementsView.layer.cornerRadius = 10.0
        self.addSubview(loginElementsView)
        
        loginElementsView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        loginElementsView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        loginElementsView.autoCenterInSuperviewMargins()
        loginElementsView.autoSetDimension(.Height, toSize: 250)
        
        
        let usernameView = UIView.newAutoLayoutView()
        usernameView.backgroundColor = UIColor.whiteColor()
        usernameView.layer.cornerRadius = 5.0
        loginElementsView.addSubview(usernameView)
        
        usernameView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 0, 10.0), excludingEdge: .Bottom)
        usernameView.autoSetDimension(.Height, toSize: 50)
        
        
        usernameTextField.delegate = self
        usernameTextField.textAlignment = .Center
        usernameTextField.placeholder = "username"
        usernameView.addSubview(usernameTextField)
        
        usernameTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        let passwordView = UIView.newAutoLayoutView()
        passwordView.backgroundColor = UIColor.whiteColor()
        passwordView.layer.cornerRadius = 5.0
        loginElementsView.addSubview(passwordView)
        
        passwordView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        passwordView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        passwordView.autoPinEdge(.Top, toEdge: .Bottom, ofView: usernameView, withOffset: 10.0)
        passwordView.autoSetDimension(.Height, toSize: 50)
        
        
        passwordTextField.delegate = self
        passwordTextField.textAlignment = .Center
        passwordTextField.secureTextEntry = true
        passwordTextField.placeholder = "password"
        passwordView.addSubview(passwordTextField)
        
        passwordTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        let generatedCodeView = UIView.newAutoLayoutView()
        generatedCodeView.backgroundColor = UIColor.whiteColor()
        generatedCodeView.layer.cornerRadius = 5.0
        loginElementsView.addSubview(generatedCodeView)
        
        generatedCodeView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        generatedCodeView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        generatedCodeView.autoPinEdge(.Top, toEdge: .Bottom, ofView: passwordView, withOffset: 10.0)
        generatedCodeView.autoSetDimension(.Height, toSize: 50)
        
        
        generatedCodeTextField.delegate = self
        generatedCodeTextField.textAlignment = .Center
        generatedCodeTextField.placeholder = "code"
        generatedCodeTextField.keyboardType = .NumberPad
        generatedCodeTextField.delegate = self
        generatedCodeView.addSubview(generatedCodeTextField)
        
        generatedCodeTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(5.0, 0.0, 5.0, 5.0), excludingEdge: .Right)
        generatedCodeTextField.autoSetDimension(.Width, toSize: (generatedCodeViewWidth / 2.0))
        
        
        generatedCodeLabel.textAlignment = .Center
        generatedCodeLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        generatedCodeLabel.textColor = UIColor ( red: 0.8392, green: 0.1961, blue: 0.2902, alpha: 1.0 )
        generatedCodeLabel.text = "24512"
        generatedCodeView.addSubview(generatedCodeLabel)
        
        generatedCodeLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(5.0, 5.0, 5.0, 0.0), excludingEdge: .Left)
        generatedCodeLabel.autoSetDimension(.Width, toSize: (generatedCodeViewWidth / 2.0))
        
        
        signInButton.backgroundColor = UIColor.loginButtonBacgrounColor()
        signInButton.titleLabel?.textColor = UIColor.whiteColor()
        signInButton.setTitle("Sign in", forState: .Normal)
        signInButton.layer.cornerRadius = 5.0
        loginElementsView.addSubview(signInButton)
        
        signInButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        signInButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        signInButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: generatedCodeView, withOffset: 10.0)
        signInButton.autoSetDimension(.Width, toSize: (generatedCodeViewWidth / 2.0))

        
        signUpButton.backgroundColor = UIColor.outgoingMessageColor()
        signUpButton.titleLabel?.textColor = UIColor.whiteColor()
        signUpButton.setTitle("Sign up", forState: .Normal)
        signUpButton.layer.cornerRadius = 5.0
        loginElementsView.addSubview(signUpButton)
        
        signUpButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        signUpButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        signUpButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: generatedCodeView, withOffset: 10.0)
        signUpButton.autoSetDimension(.Width, toSize: (generatedCodeViewWidth / 2.0))
        

        logButton.setImage(UIImage(named: "middleMan"), forState: .Normal)
        logButton.backgroundColor = UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6 )
        logButton.contentMode = .ScaleAspectFit
        logButton.setTitle(" Man-in-the-Middle", forState: .Normal)
        logButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        logButton.layer.cornerRadius = 10
        self.addSubview(logButton)
        
        logButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        logButton.autoAlignAxisToSuperviewAxis(.Vertical)
        logButton.autoSetDimensionsToSize(CGSizeMake(200, 45))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITextField Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if textField == generatedCodeTextField {
            let currentCharacterCount = textField.text?.characters.count ?? 0
            if (range.length + range.location > currentCharacterCount){
                return false
            }
            let newLength = currentCharacterCount + string.characters.count - range.length
            return newLength <= 5
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    }
    
}
