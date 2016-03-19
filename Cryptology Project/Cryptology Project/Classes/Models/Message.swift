//
//  Message.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 20/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


enum MessageType: Int {
    case IncomingMessage
    case OutgoingMessage
}


class Message: NSObject {
    
    var message: RealmMessage!
    var messagteType: MessageType!
    
    init(message: RealmMessage, type: MessageType) {
        self.message = message
        self.messagteType = type
    }
}
