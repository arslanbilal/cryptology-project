//
//  Message.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation
import RealmSwift


class RealmMessage: Object {
    dynamic var id = 0
    dynamic var text = ""
    dynamic var date = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    class var messageId: Int {
        let realm = try! Realm()
        
        let messages: NSArray = Array(realm.objects(RealmMessage).sorted("id"))
        let last = messages.lastObject
        
        if messages.count > 0 {
            let id = last?.valueForKey("id") as? Int
            return id! + 1
        } else {
            return 1
        }
    }
}
