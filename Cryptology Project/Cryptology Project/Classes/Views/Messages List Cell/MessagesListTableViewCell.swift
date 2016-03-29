//
//  MessageListTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesListTableViewCell: UITableViewCell {

    private let profileImageView = UIImageView.newAutoLayoutView()
    private let profileNameLabel = UILabel.newAutoLayoutView()
    private let profileLastMessageLabel = UILabel.newAutoLayoutView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        self.selectionStyle = .None
        
        profileImageView.layer.cornerRadius = 27.5
        self.addSubview(profileImageView)
        
        profileImageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 10.0, 0), excludingEdge: .Right)
        profileImageView.autoSetDimension(.Width, toSize: 55)
        
        
        let profileInfoView = UIView.newAutoLayoutView()
        self.addSubview(profileInfoView)
        
        profileInfoView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 0, 10.0, 10.0), excludingEdge: .Left)
        profileInfoView.autoPinEdge(.Left, toEdge: .Right, ofView: profileImageView, withOffset: 10.0)
        
        
        profileNameLabel.textColor = UIColor.blackColor()
        profileNameLabel.textAlignment = .Left
        profileNameLabel.numberOfLines = 1
        profileNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        profileInfoView.addSubview(profileNameLabel)
        
        profileNameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        profileNameLabel.autoSetDimension(.Height, toSize: 20)
        
        
        profileLastMessageLabel.textColor = UIColor.grayColor()
        profileLastMessageLabel.textAlignment = .Left
        profileLastMessageLabel.numberOfLines = 2
        profileLastMessageLabel.font = UIFont(name: "HelveticaNeue", size: 12)
        profileInfoView.addSubview(profileLastMessageLabel)
        
        profileLastMessageLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Top)
        profileLastMessageLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: profileNameLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(messageList: MessageList) {
        self.profileNameLabel.text = "\(messageList.otherUser.name) \(messageList.otherUser.lastname)"
        self.profileLastMessageLabel.text =  FBEncryptorAES.decryptBase64String(messageList.messages.last?.message.text, keyString: messageList.messageKey)
        self.profileImageView.backgroundColor = UIColor.grayColor()
    }
}
