//
//  UserViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.title = ActiveUser.sharedInstance.user.username
        
        self.loadViews()
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        let passwordChangeButton = UIButton.newAutoLayoutView()
        passwordChangeButton.backgroundColor = UIColor.loginViewBackgroundColor()
        passwordChangeButton.layer.cornerRadius = 15.0
        passwordChangeButton.setTitle("Change Password", forState: .Normal)
        passwordChangeButton.addTarget(self, action: #selector(UserViewController.didTapPasswordChangeButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(passwordChangeButton)
        
        passwordChangeButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(15.0, 15.5, 0.0, 15.5), excludingEdge: .Bottom)
        passwordChangeButton.autoSetDimension(.Height, toSize: 50.0)
        
        
        let keyChangeButton = UIButton.newAutoLayoutView()
        keyChangeButton.backgroundColor = UIColor.loginViewBackgroundColor()
        keyChangeButton.layer.cornerRadius = 15.0
        keyChangeButton.setTitle("Change Keys", forState: .Normal)
        keyChangeButton.addTarget(self, action: #selector(UserViewController.didTapKeyChangeButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(keyChangeButton)
        
        keyChangeButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.5)
        keyChangeButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.5)
        keyChangeButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: passwordChangeButton, withOffset: 15.0)
        keyChangeButton.autoSetDimension(.Height, toSize: 50.0)
        
        let signOutButton = UIButton.newAutoLayoutView()
        signOutButton.backgroundColor = UIColor.loginViewBackgroundColor()
        signOutButton.layer.cornerRadius = 15.0
        signOutButton.setTitle("Sign Out", forState: .Normal)
        signOutButton.addTarget(self, action: #selector(UserViewController.didTapSignOutButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(signOutButton)
        
        signOutButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.5)
        signOutButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.5)
        signOutButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: keyChangeButton, withOffset: 15.0)
        signOutButton.autoSetDimension(.Height, toSize: 50.0)
    }
    
    // MARK: - Button Actions
    func didTapPasswordChangeButton(sender: UIButton) {
        let passwordEditViewController = PasswordEditViewController()
        passwordEditViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(passwordEditViewController, animated: true)
    }
    
    func didTapKeyChangeButton(sender: UIButton) {
        let keysTableViewController = KeysTableViewController()
        keysTableViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(keysTableViewController, animated: true)
    }
    
    func didTapSignOutButton(sender: UIBarButtonItem) {
        self.tabBarController!.dismissViewControllerAnimated(true) { () -> Void in
            ActiveUser.sharedInstance.exitUser()
        }
    }
}
