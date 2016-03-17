//
//  AppDelegate.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        print("\(urls[urls.count - 1])")
        
        return true
    }
}
