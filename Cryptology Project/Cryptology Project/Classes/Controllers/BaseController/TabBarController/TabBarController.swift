//
//  TabBarController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor.loginViewBackgroundColor()
        self.tabBar.translucent = false
        self.tabBar.tintColor = UIColor.whiteColor()
        
        let nav1 = NavigationController(rootViewController: MessagesListViewController())
        nav1.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chat"))
        
        
        let nav2 = NavigationController(rootViewController: UserViewController())
        nav2.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))

        
        let manInTheMiddleTableViewController = ManInTheMiddleTableViewController()
        manInTheMiddleTableViewController.exitButton = false
        let nav3 = NavigationController(rootViewController: manInTheMiddleTableViewController)
        nav3.tabBarItem = UITabBarItem(title: "ManInTheMiddle", image: UIImage(named: "middleMan"), selectedImage: UIImage(named: "middleMan"))
        
        self.viewControllers = [nav1, nav2, nav3]
    }
}
