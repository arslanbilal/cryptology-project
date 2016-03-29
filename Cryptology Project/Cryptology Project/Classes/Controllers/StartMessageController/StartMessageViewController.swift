//
//  StartMessageViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class StartMessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "userCell"
    let tableView = UITableView.newAutoLayoutView()
    var userList = [RealmUser]()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.navigationBarBackgroundColor()
        
        self.navigationItem.title = "Start Chat"
        self.navigationItem.prompt = ActiveUser.sharedInstance.user.name    + " " + ActiveUser.sharedInstance.user.lastname
        
        tableView.registerClass(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        //tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.autoPinEdgesToSuperviewEdges()
        
        userList = ActiveUser.sharedInstance.userList
        tableView.reloadData()
    }
    
    // MARK: - UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! UserTableViewCell
        
        cell.setContents(userList[indexPath.row])
        
        return cell
    }
    
    // MARK: UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedUser = userList[indexPath.row]
        let messageList: MessageList
        
        if let userMessageList = ActiveUser.sharedInstance.getMesageListFromUserId(selectedUser.id) {
            messageList = userMessageList
        } else {
            messageList = MessageList(otherUser: selectedUser, message: nil, messageType: nil, messageKey: "")
        }
        
        let viewControllersCount = self.navigationController?.viewControllers.count
        let messagesListViewController = self.navigationController?.viewControllers[viewControllersCount! - 2] as! MessagesListViewController
        messagesListViewController.messageList = messageList
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
