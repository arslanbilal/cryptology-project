//
//  Chat.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation
import RealmSwift


class Chat: Object {
    dynamic var messageId = 0
    dynamic var fromUserId = 0
    dynamic var toUserId = 0
}
