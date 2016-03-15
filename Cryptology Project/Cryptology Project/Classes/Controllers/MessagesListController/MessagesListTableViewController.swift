//
//  MessagesListTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class MessagesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Chats"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: "didTapExitButton:")
        
        tableView.registerClass(MessagesListTableViewCell.self, forCellReuseIdentifier: "messagesTableViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        
    }
    
    // MARK: UITableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesListTableViewCell = tableView.dequeueReusableCellWithIdentifier("messagesTableViewCell", forIndexPath: indexPath) as! MessagesListTableViewCell
        
        cell.profileNameLabel.text = "User \(indexPath.row + 1)"
        cell.profileLastMessageLabel.text = "asdafkjbsfasdflhasdfhl aslhdfsadfasdashdvasj gdashldsdfsdf ha adfasdas dasas"
        cell.profileImageView.backgroundColor = UIColor.redColor()
        return cell
    }
    
    // MARK: UITableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("Clicked the cell")
    }
    
    // MARK: Button Actions
    func didTapExitButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
