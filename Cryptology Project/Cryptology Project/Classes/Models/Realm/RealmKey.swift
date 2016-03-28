//
//  RealmKey.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 28/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation
import RealmSwift


class RealmKey: Object {
    dynamic var id = 0
    dynamic var key = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    class var keyId: Int {
        let realm = try! Realm()
        
        let keys: NSArray = Array(realm.objects(RealmKey).sorted("id"))
        let last = keys.lastObject
        
        if keys.count > 0 {
            let id = last?.valueForKey("id") as? Int
            return id! + 1
        } else {
            return 1
        }
    }
}
