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
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.loginButton.addTarget(self, action: #selector(LoginViewController.didTapLoginButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginView)
        
        loginView.autoPinEdgesToSuperviewEdges()
        
        let logButton = UIButton.newAutoLayoutView()
        logButton.setImage(UIImage(named: "middleMan"), forState: .Normal)
        logButton.backgroundColor = UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6 )
        logButton.contentMode = .ScaleAspectFit
        logButton.setTitle(" Man-in-the-Middle", forState: .Normal)
        logButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 13)
        logButton.layer.cornerRadius = 10
        logButton.addTarget(self, action: #selector(LoginViewController.didTapLogButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(logButton)
        self.view.bringSubviewToFront(logButton)
        
        logButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        logButton.autoAlignAxisToSuperviewAxis(.Vertical)
        logButton.autoSetDimensionsToSize(CGSizeMake(150, 40))
    }
    
    // MARK: - Button Actions
    func didTapLoginButton(sender: UIButton) {
        let username = loginView.usernameTextField.text!
        let password = loginView.passwordTextField.text!
        
        if  username != "" && password != "" {
            let user = realm.objects(RealmUser).filter("username = '\(username)' AND password = '\(password)'").first
            
            if user != nil {
                ActiveUser.sharedInstance.setActiveUser(user!)
                
                loginView.usernameTextField.text = ""
                loginView.passwordTextField.text = ""
                
                self.presentViewController(NavigationController(rootViewController: MessagesListViewController()), animated: true, completion: nil)
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
    
    func didTapLogButton(sender :UIBarButtonItem) {
        self.presentViewController(NavigationController(rootViewController: ManInTheMiddleTableViewController()), animated: true, completion: nil)
    }
}
