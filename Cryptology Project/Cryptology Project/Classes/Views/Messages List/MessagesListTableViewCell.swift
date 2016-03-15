//
//  MessageListTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesListTableViewCell: UITableViewCell {

    var profileImageView = UIImageView()
    var profileNameLabel = UILabel()
    var profileLastMessageLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.5
        self.selectionStyle = .None
        
        profileImageView = UIImageView.newAutoLayoutView()
        profileImageView.layer.cornerRadius = 27.5
        self.addSubview(profileImageView)
        
        profileImageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 10.0, 10.0, 0), excludingEdge: .Right)
        profileImageView.autoSetDimension(.Width, toSize: 55)
        
        
        let profileInfoView = UIView.newAutoLayoutView()
        self.addSubview(profileInfoView)
        
        profileInfoView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 0, 10.0, 10.0), excludingEdge: .Left)
        profileInfoView.autoPinEdge(.Left, toEdge: .Right, ofView: profileImageView, withOffset: 10.0)
        
        
        profileNameLabel = UILabel.newAutoLayoutView()
        profileNameLabel.textColor = UIColor.blackColor()
        profileNameLabel.textAlignment = .Left
        profileNameLabel.numberOfLines = 1
        profileNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        profileInfoView.addSubview(profileNameLabel)
        
        profileNameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        profileNameLabel.autoSetDimension(.Height, toSize: 20)
        
        
        profileLastMessageLabel = UILabel.newAutoLayoutView()
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
}
