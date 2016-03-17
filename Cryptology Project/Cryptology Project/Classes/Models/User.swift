//
//  User.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation
import RealmSwift


class User: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var lastname = ""
    dynamic var username = ""
    dynamic var password = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    class var userId: Int {
        let realm = try! Realm()
        
        let users: NSArray = Array(realm.objects(User).sorted("id"))
        let last = users.lastObject
        
        if users.count > 0 {
            let id = last?.valueForKey("id") as? Int
            return id! + 1
        } else {
            return 1
        }
    }
}
