//
//  MessageList.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessageList: NSObject {
    
    var id: Int
    var name: String
    var lastname: String
    var username: String
    var messages: [Message]!
    
    init(id: Int, name: String, lastname: String, username: String, message: Message) {
        self.id = id
        self.name = name
        self.lastname = lastname
        self.username = username
        self.messages.append(message)
    }
}
