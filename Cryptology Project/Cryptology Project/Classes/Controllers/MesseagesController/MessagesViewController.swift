//
//  MessagesViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "messagesTableViewCell"
    let tableView = UITableView.newAutoLayoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Messages"
        
        tableView.registerClass(MessagesTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 77.5
        tableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(tableView)
        
        tableView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 0.0, 50.0, 0.0))
        
        let bottomView = UIView.newAutoLayoutView()
        bottomView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(bottomView)
        
        bottomView.autoPinEdge(.Top, toEdge: .Bottom, ofView: tableView)
        bottomView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0), excludingEdge: .Top)
    }
    
    // MARK: UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessagesTableViewCell
        
        cell.messageDateLabel.text = "Date: 12 March 2016 12:34"
        cell.messageLabel.text = "#\(indexPath.row) Message goes here.."
        
        return cell
    }
}
