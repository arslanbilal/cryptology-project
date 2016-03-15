//
//  LoginController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let loginView = LoginView(frame: CGRectMake(0,0,0,0))
    
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
        let navigationController = NavigationController(rootViewController: MessagesController())
        self.presentViewController(navigationController, animated: true) { () -> Void in
            
        }
    }
}
