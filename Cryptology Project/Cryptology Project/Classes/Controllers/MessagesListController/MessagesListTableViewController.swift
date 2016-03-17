//
//  MessagesListTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesListTableViewController: UITableViewController {
    
    let cellIdentifier = "messagesListTableViewCell"
    var chatList = [MessageList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Chats"
        self.navigationItem.prompt = ActiveUser.sharedInstance.name + " " + ActiveUser.sharedInstance.lastname
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: "didTapExitButton:")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        
        tableView.registerClass(MessagesListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        
        chatList = ActiveUser.sharedInstance.chatList
        tableView.reloadData()
    }

    // MARK: UITableView Datasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesListTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessagesListTableViewCell
        
        let index = indexPath.row
        cell.profileNameLabel.text = "\(chatList[index]) \(chatList[index].lastname)"
        cell.profileLastMessageLabel.text = chatList[index].messages.last?.text
        cell.profileImageView.backgroundColor = UIColor ( red: 0.7054, green: 0.5915, blue: 1.0, alpha: 1.0 )
        return cell
    }
    
    // MARK: UITableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(MessagesViewController(), animated: true)
    }
    
    // MARK: Button Actions
    func didTapExitButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
