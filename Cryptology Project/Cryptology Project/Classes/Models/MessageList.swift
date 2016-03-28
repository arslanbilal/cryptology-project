//
//  MessageList.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessageList: NSObject {
    
    let otherUser: RealmUser!
    var messages: [Message]!
    let messageKey: String!
    
    init(otherUser: RealmUser, message: Message?, messageType: MessageType?, messageKey: String) {
        self.otherUser = otherUser
        self.messageKey = messageKey
        
        if message != nil {
            message!.messagteType = messageType!
            self.messages = [Message]()
            self.messages.append(message!)
        }
    }
}
