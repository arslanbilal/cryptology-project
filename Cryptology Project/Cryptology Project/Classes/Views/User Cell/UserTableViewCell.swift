//
//  UserTableViewCell.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class UserTableViewCell: UITableViewCell {
    
    private var profileImageView = UIImageView.newAutoLayoutView()
    private var profileNameLabel = UILabel.newAutoLayoutView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .None
        
        profileImageView.layer.cornerRadius = 22.5
        self.addSubview(profileImageView)
        
        profileImageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(7.5, 7.5, 7.5, 0.0), excludingEdge: .Right)
        profileImageView.autoSetDimension(.Width, toSize: 45.0)
        
        
        profileNameLabel.textColor = UIColor.blackColor()
        profileNameLabel.textAlignment = .Left
        profileNameLabel.numberOfLines = 1
        profileNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        self.addSubview(profileNameLabel)
        
        profileNameLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(15.0, 0.0, 15.0, 5.0), excludingEdge: .Left)
        profileNameLabel.autoPinEdge(.Left, toEdge: .Right, ofView: profileImageView, withOffset: 5.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContents(user: User) {
        self.profileNameLabel.text = user.name + " " + user.lastname
        self.profileImageView.backgroundColor = UIColor.grayColor()
    }
}
