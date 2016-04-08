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

        // Do any additional setup after loading the view.
        
        self.tabBar.barTintColor = UIColor.loginViewBackgroundColor()
        self.tabBar.tintColor = UIColor.whiteColor()
        
        let nav1 = NavigationController(rootViewController: MessagesListViewController())
        let nav2 = NavigationController(rootViewController: UserViewController())
        let nav3 = NavigationController(rootViewController: ManInTheMiddleTableViewController())
        
        nav1.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "chat"), selectedImage: UIImage(named: "chat"))
        nav2.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        nav3.tabBarItem = UITabBarItem(title: "ManInTheMiddle", image: UIImage(named: "middleMan"), selectedImage: UIImage(named: "middleMan"))
        
        self.viewControllers = [nav1, nav2, nav3]
        
        
        
        // customize!
        /*
         
         
         let tabBarController = UITabBarController()
         
         let myVC1 = PieVC(nibName: "PieVC", bundle: nil)
         let myVC2 = PizzaVC(nibName: "PizzaVC", bundle: nil)
         
         let controllers = [myVC1,myVC2]
         tabBarController.viewControllers = controllers
         
         window?.rootViewController = tabBarController
         
         let firstImage = UIImage(named: "pie bar icon")
         let secondImage = UIImage(named: "pizza bar icon")
         myVC1.tabBarItem = UITabBarItem(title: "Pie", image: firstImage, tag: 1)
         myVC2.tabBarItem = UITabBarItem(title: "Pizza", image: secondImage, tag:2)
         
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
