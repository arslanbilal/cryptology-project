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
    let realm = try! Realm()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        
        //        // Simulator/Device Document Directory
        //        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        //        print("\(urls[urls.count - 1])")
        
        //generateUsersWithCount(9)
        
        return true
    }
    
    // Generete User for testing
    func generateUsersWithCount(count: Int) {
        for i in (0 ..< count) {
            let user = RealmUser()
            user.id = RealmUser.userId
            user.name = "#\(i+1) User"
            user.lastname = "Lastname"
            user.username = "user\(i+1)"
            let salt = FBEncryptorAES.generateKey()
            user.passwordSalt = salt
            user.passwordHash = FBEncryptorAES.generateSHA512(("1234" + salt))
            user.isLocked = false
            user.attemptableDate = NSDate()
            user.wrongAttemptCount = 0
            
            try! realm.write {
                realm.add(user)
            }
        }
    }
}
