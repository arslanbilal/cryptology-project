//
//  Chat.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation
import RealmSwift


class RealmChat: Object {
    dynamic var message: RealmMessage? = nil
    dynamic var fromUser: RealmUser? = nil
    dynamic var toUser: RealmUser? = nil
    dynamic var key: RealmKey? = nil
}
