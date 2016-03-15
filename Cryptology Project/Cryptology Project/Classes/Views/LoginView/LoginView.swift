//
//  LoginView.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 14/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class LoginView: UIView {
    
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.loginViewBackgroundColor()
        
        let screenHeigt: CGFloat = UIScreen.mainScreen().bounds.height - 30
        let appNameLabelHeight = screenHeigt / 3
        let loginElementsViewHeight = ((appNameLabelHeight * 2) * 0.6)
        let distanceAppNameLabelAndLoginView = ((appNameLabelHeight * 2) * 0.1)
        let distanceBetweenLoginElements = (loginElementsViewHeight * 0.1)

        
        let appNameLabel = UILabel.newAutoLayoutView()
        appNameLabel.textAlignment = .Center
        appNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 45.0)
        appNameLabel.numberOfLines = 0
        appNameLabel.textColor = UIColor.whiteColor()
        appNameLabel.text = "Cryptology Project"
        self.addSubview(appNameLabel)
        
        appNameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(30.0, 15.0, 0, 15.0), excludingEdge: .Bottom)
        appNameLabel.autoSetDimension(.Height, toSize: appNameLabelHeight)
        
        
        let loginElementsView = UIView.newAutoLayoutView()
        loginElementsView.backgroundColor = UIColor.init(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.3)
        loginElementsView.layer.cornerRadius = 10.0
        self.addSubview(loginElementsView)
        
        loginElementsView.autoPinEdgeToSuperviewEdge(.Left, withInset: 3.0)
        loginElementsView.autoPinEdgeToSuperviewEdge(.Right, withInset: 3.0)
        loginElementsView.autoPinEdge(.Top, toEdge: .Bottom, ofView: appNameLabel, withOffset: distanceAppNameLabelAndLoginView)
        loginElementsView.autoSetDimension(.Height, toSize: loginElementsViewHeight)
        
        
        let usernameLabel = UILabel.newAutoLayoutView()
        usernameLabel.textAlignment = .Left
        usernameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        usernameLabel.textColor = UIColor.whiteColor()
        usernameLabel.text = "Username:"
        loginElementsView.addSubview(usernameLabel)
        
        usernameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 5.0, 0, 5.0), excludingEdge: .Bottom)
        usernameLabel.autoSetDimension(.Height, toSize: distanceBetweenLoginElements)
        
        
        let usernameView = UIView.newAutoLayoutView()
        usernameView.backgroundColor = UIColor.whiteColor()
        usernameView.layer.cornerRadius = 3.0
        loginElementsView.addSubview(usernameView)
        
        usernameView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5.0)
        usernameView.autoPinEdgeToSuperviewEdge(.Right, withInset: 5.0)
        usernameView.autoPinEdge(.Top, toEdge: .Bottom, ofView: usernameLabel)
        usernameView.autoSetDimension(.Height, toSize: distanceBetweenLoginElements * 1.5)
        
        
        usernameView.addSubview(usernameTextField)
        usernameTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        let passwordLabel = UILabel.newAutoLayoutView()
        passwordLabel.textAlignment = .Left
        passwordLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        passwordLabel.textColor = UIColor.whiteColor()
        passwordLabel.text = "Password:"
        loginElementsView.addSubview(passwordLabel)
        
        passwordLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 5.0)
        passwordLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 5.0)
        passwordLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: usernameView, withOffset: distanceBetweenLoginElements / 2)
        passwordLabel.autoSetDimension(.Height, toSize: distanceBetweenLoginElements)
        
        
        let passwordView = UIView.newAutoLayoutView()
        passwordView.backgroundColor = UIColor.whiteColor()
        passwordView.layer.cornerRadius = 3.0
        loginElementsView.addSubview(passwordView)
        
        passwordView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5.0)
        passwordView.autoPinEdgeToSuperviewEdge(.Right, withInset: 5.0)
        passwordView.autoPinEdge(.Top, toEdge: .Bottom, ofView: passwordLabel)
        passwordView.autoSetDimension(.Height, toSize: distanceBetweenLoginElements * 1.5)
        
        
        passwordView.addSubview(passwordTextField)
        passwordTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        loginButton.backgroundColor = UIColor.loginButtonBacgrounColor()
        loginButton.titleLabel?.textColor = UIColor.whiteColor()
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.layer.cornerRadius = 5.0
        loginElementsView.addSubview(loginButton)
        
        loginButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        loginButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        loginButton.autoSetDimensionsToSize(CGSizeMake(120, distanceBetweenLoginElements * 1.7))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
