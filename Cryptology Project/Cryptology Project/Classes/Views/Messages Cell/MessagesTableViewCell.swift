//
//  MessagesTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesTableViewCell: UITableViewCell {
    
    private var messageDateLabel = UILabel.newAutoLayoutView()
    private var messageLabel = UILabel.newAutoLayoutView()
    private var messageView = UIView.newAutoLayoutView()
    
    private var leftConstraint: NSLayoutConstraint?
    private var rightConstraint: NSLayoutConstraint?
    
    private let messageCellWidth = (UIScreen.mainScreen().bounds.size.width * 0.65) - 10
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = .None
        
        
        messageView.layer.cornerRadius = 10.0
        self.addSubview(messageView)
        
        messageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0))
//        messageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
//        messageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10)
//        messageView.autoSetDimension(.Width, toSize: messageCellWidth)
        
        
        messageDateLabel.numberOfLines = 1
        messageDateLabel.textColor = UIColor.whiteColor()
        messageDateLabel.textAlignment = .Left
        messageDateLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 13)
        messageView.addSubview(messageDateLabel)
        
        messageDateLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 15.0, 0, 15.0), excludingEdge: .Bottom)
        messageDateLabel.autoSetDimension(.Height, toSize: 15)
        
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.textAlignment = .Left
        messageLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        messageView.addSubview(messageLabel)
        
        messageLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: messageDateLabel, withOffset: 7.5)
        messageLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0, 15.0, 10.0, 15.0), excludingEdge: .Top)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMessageType(type: MessageType) {
        if (leftConstraint != nil) {
            messageView.removeConstraint(leftConstraint!)
        }
        
        if (rightConstraint != nil) {
            messageView.removeConstraint(rightConstraint!)
        }
        
        switch (type) {
        case .IncomingMessage:
            messageView.backgroundColor = UIColor.incomingMessageColor()
            //leftConstraint = messageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
            break
        case .OutgoingMessage:
            messageView.backgroundColor = UIColor.outgoingMessageColor()
            //rightConstraint = messageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
            break
        }
    }
    
    func setContent(message: Message, messageKey: String) {
        self.messageDateLabel.text = Helper.getStringDateFromDate(message.message.date)
        self.messageLabel.text = FBEncryptorAES.decryptBase64String(message.message.text, keyString: messageKey)
        self.setMessageType(message.messagteType)
    }
}
