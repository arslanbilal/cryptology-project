//
//  KeyEditTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class KeysTableViewController: UITableViewController {
    
    let cellIdentifier = "keyCell"
    var messageList: [MessageList] = ActiveUser.sharedInstance.chatList
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = ActiveUser.sharedInstance.user.username + " Keys"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        
        self.tableView.registerClass(KeyListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    // MARK: UITableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: KeyListTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! KeyListTableViewCell
        
        cell.setContent(messageList[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    // MARK: UITableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let keyChangeViewController = KeyChangeViewController()
        keyChangeViewController.messageList = messageList[indexPath.row]
        self.navigationController?.pushViewController(keyChangeViewController, animated: true)
    }
    
}
