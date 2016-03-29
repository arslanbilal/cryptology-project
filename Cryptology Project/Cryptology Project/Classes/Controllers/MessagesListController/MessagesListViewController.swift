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
        self.navigationItem.prompt = ActiveUser.sharedInstance.user.name + " " + ActiveUser.sharedInstance.user.lastname
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: #selector(MessagesListViewController.didTapExitButton(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Done, target: self, action: #selector(MessagesListViewController.didTapAddChatButton(_:)))
        
        tableView.registerClass(MessagesListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.autoPinEdgesToSuperviewEdges()
        
        
        let logButton = UIButton.newAutoLayoutView()
        logButton.setImage(UIImage(named: "middleMan"), forState: .Normal)
        logButton.backgroundColor = UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6 )
        logButton.contentMode = .ScaleAspectFit
        logButton.setTitle(" Man-in-the-Middle", forState: .Normal)
        logButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 13)
        logButton.layer.cornerRadius = 10
        logButton.addTarget(self, action: #selector(MessagesListViewController.didTapLogButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(logButton)
        self.view.bringSubviewToFront(logButton)
        
        logButton.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 10.0)
        logButton.autoAlignAxisToSuperviewAxis(.Vertical)
        logButton.autoSetDimensionsToSize(CGSizeMake(150, 40))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if messageList != nil {
            let messagesViewController = MessagesViewController()
            messagesViewController.messageList = messageList!
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
        self.navigationController?.pushViewController(messagesViewController, animated: true)
    }
    
    // MARK: - Button Actions
    func didTapExitButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            ActiveUser.sharedInstance.exitUser()
        }
    }
    
    func didTapAddChatButton(sender :UIBarButtonItem) {
        self.navigationController?.pushViewController(StartMessageViewController(), animated: true)
    }
    
    func didTapLogButton(sender :UIBarButtonItem) {
        self.presentViewController(NavigationController(rootViewController: ManInTheMiddleTableViewController()), animated: true, completion: nil)
    }
}
