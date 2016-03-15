//
//  MessagesTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


enum MessageType {
    case IncomingMessage
    case OutgoingMessage
}


class MessagesTableViewCell: UITableViewCell {
    
    let messageDateLabel = UILabel()
    let messageLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMessageType(type: MessageType) {
        switch (type) {
        case .IncomingMessage:
            self.backgroundColor = UIColor.incomingMessageColor()
            break
        case .OutgoingMessage:
            self.backgroundColor = UIColor.outgoingMessageColor()
            break
        }
    }
}
