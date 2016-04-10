//
//  KeyListTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class KeyListTableViewCell: UITableViewCell {
    
    private let usersLabel = UILabel.newAutoLayoutView()
    private let keyLabel = UILabel.newAutoLayoutView()
    private let keyImageView = UIImageView.newAutoLayoutView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.whiteColor()
        self.selectionStyle = .None
        
        
        keyImageView.layer.cornerRadius = 22.5
        keyImageView.contentMode = .ScaleAspectFit
        self.addSubview(keyImageView)
        
        keyImageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(15.0, 10.0, 15.0, 0), excludingEdge: .Right)
        keyImageView.autoSetDimension(.Width, toSize: 45)
        
        
        let keyInfoView = UIView.newAutoLayoutView()
        self.addSubview(keyInfoView)
        
        keyInfoView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 0, 10.0, 10.0), excludingEdge: .Left)
        keyInfoView.autoPinEdge(.Left, toEdge: .Right, ofView: keyImageView, withOffset: 10.0)
        
        
        usersLabel.numberOfLines = 1
        usersLabel.textColor = UIColor.blackColor()
        usersLabel.textAlignment = .Left
        usersLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        keyInfoView.addSubview(usersLabel)
        
        usersLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        usersLabel.autoSetDimension(.Height, toSize: 15)
        
        keyLabel.numberOfLines = 2
        keyLabel.textColor = UIColor.blackColor()
        keyLabel.textAlignment = .Left
        keyLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        keyInfoView.addSubview(keyLabel)
        
        keyLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Top)
        keyLabel.autoSetDimension(.Height, toSize: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(messageList: MessageList) {
        self.usersLabel.text = ActiveUser.sharedInstance.user.username + " <=> " + messageList.otherUser.username
        self.keyLabel.text = messageList.messageKey!.key
        self.keyImageView.image = UIImage(named: "key")
    }
}
