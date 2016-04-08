//
//  MessagesListViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 29/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class MessagesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "messagesListTableViewCell"
    var chatList = [MessageList]()
    var messageList: MessageList?
    let tableView = UITableView.newAutoLayoutView()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.navigationItem.title = "Chats"

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: #selector(MessagesListViewController.didTapExitButton(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Compose, target: self, action: #selector(MessagesListViewController.didTapAddChatButton(_:)))
        
        tableView.registerClass(MessagesListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if messageList != nil {
            let messagesViewController = MessagesViewController()
            messagesViewController.messageList = messageList!
            messagesViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(messagesViewController, animated: true)
            messageList = nil
            return
        }
        
        chatList = ActiveUser.sharedInstance.chatList
        tableView.reloadData()
    }
    
    // MARK: - UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesListTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessagesListTableViewCell
        
        cell.setContent(chatList[indexPath.row])
        
        return cell
    }
    
    // MARK: UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let messagesViewController = MessagesViewController()
        messagesViewController.messageList = chatList[indexPath.row]
        messagesViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(messagesViewController, animated: true)
    }
    
    // MARK: - Button Actions
    func didTapExitButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            ActiveUser.sharedInstance.exitUser()
        }
    }
    
    func didTapAddChatButton(sender :UIBarButtonItem) {
        let startMessageViewController = StartMessageViewController()
        startMessageViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(startMessageViewController, animated: true)
    }
}
