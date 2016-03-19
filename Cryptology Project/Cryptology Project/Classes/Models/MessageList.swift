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
    
    init(otherUser: RealmUser, message: Message?, messageType: MessageType?) {
        self.otherUser = otherUser
        
        if message != nil {
            message!.messagteType = messageType!
            self.messages = [Message]()
            self.messages.append(message!)
        }
    }
}
