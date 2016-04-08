//
//  KeyEditTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class KeyEditTableViewController: UITableViewController {
    
    let keyCellIdentifier = "keyCell"
    var messageList: [MessageList] = ActiveUser.sharedInstance.chatList
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UITableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(keyCellIdentifier, forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK: UITableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
