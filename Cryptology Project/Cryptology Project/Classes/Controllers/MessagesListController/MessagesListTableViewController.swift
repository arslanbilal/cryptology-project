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
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: "didTapExitButton:")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Done, target: self, action: "didTapAddChatButton:")
        
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
        
        cell.setContent(chatList[indexPath.row])
        
        return cell
    }
    
    // MARK: UITableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let messagesViewController = MessagesViewController()
        messagesViewController.messageList = chatList[indexPath.row]
        self.navigationController?.pushViewController(messagesViewController, animated: true)
    }
    
    // MARK: Button Actions
    func didTapExitButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            ActiveUser.sharedInstance.exitUser()
        }
    }
    
    func didTapAddChatButton(sender :UIBarButtonItem) {
        self.navigationController?.pushViewController(StartMessageViewController(), animated: true)
    }
}
