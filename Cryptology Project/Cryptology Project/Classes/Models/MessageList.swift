//
//  MessageList.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessageList: NSObject {
    
    let otherUser: User!
    var messages: [Message]!
    
    init(otherUser: User, message: Message, messageType: MessageType) {
        self.otherUser = otherUser
        message.type = messageType
        
        self.messages = [Message]()
        self.messages.append(message)
    }
}
