//
//  LoginController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let loginView = LoginView(frame: CGRectZero)
    
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
        self.presentViewController(NavigationController(rootViewController: MessagesListTableViewController()), animated: true, completion: nil)
    }
}
