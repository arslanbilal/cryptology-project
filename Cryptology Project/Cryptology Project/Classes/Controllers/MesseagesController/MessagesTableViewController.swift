//
//  MessagesTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Messages"
        
        tableView.registerClass(MessagesListTableViewCell.self, forCellReuseIdentifier: "messagesTableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
    }
}
