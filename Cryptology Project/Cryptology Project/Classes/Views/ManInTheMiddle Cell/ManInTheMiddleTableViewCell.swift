//
//  ManInTheMiddleTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 29/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class ManInTheMiddleTableViewCell: UITableViewCell {
    
    private let messageOwnersLabel = UILabel.newAutoLayoutView()
    private let messageDateLabel = UILabel.newAutoLayoutView()
    private let messageLabel = UILabel.newAutoLayoutView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = .None
        
        let messageView = UIView.newAutoLayoutView()
        messageView.layer.cornerRadius = 10.0
        messageView.backgroundColor = UIColor.incomingMessageColor()
        self.addSubview(messageView)
        
        messageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0))
        
        
        messageOwnersLabel.numberOfLines = 1
        messageOwnersLabel.textColor = UIColor.whiteColor()
        messageOwnersLabel.textAlignment = .Left
        messageOwnersLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        messageView.addSubview(messageOwnersLabel)
        
        messageOwnersLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 15.0, 0, 15.0), excludingEdge: .Bottom)
        messageOwnersLabel.autoSetDimension(.Height, toSize: 17)
        
        
        messageDateLabel.numberOfLines = 1
        messageDateLabel.textColor = UIColor.whiteColor()
        messageDateLabel.textAlignment = .Left
        messageDateLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 13)
        messageView.addSubview(messageDateLabel)
        
        messageDateLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: messageOwnersLabel, withOffset: 7.5)
        messageDateLabel.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.0)
        messageDateLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.0)
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
    
    func setContent(message: CipherMessage) {
        self.messageOwnersLabel.text = message.owners
        self.messageDateLabel.text = Helper.getStringDateFromDate(message.date)
        self.messageLabel.text = message.message
    }
}
