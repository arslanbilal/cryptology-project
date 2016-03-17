//
//  MessagesViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let cellIdentifier = "messagesTableViewCell"
    let tableView = UITableView.newAutoLayoutView()
    private let messageTextField = UITextField.newAutoLayoutView()
    private let sendButton = UIButton.newAutoLayoutView()
    
    var messageList: MessageList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = messageList.otherUser!.name + " " + messageList.otherUser.lastname
        self.navigationItem.prompt = ActiveUser.sharedInstance.name + " " + ActiveUser.sharedInstance.lastname
        
        loadViews()
        
        tableView.reloadData()
    }
    
    // MARK: UI initialisation
    func loadViews() {
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
        bottomView.backgroundColor = UIColor ( red: 0.8982, green: 0.8982, blue: 0.8982, alpha: 1.0 )
        self.view.addSubview(bottomView)
        
        bottomView.autoPinEdge(.Top, toEdge: .Bottom, ofView: tableView)
        bottomView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0), excludingEdge: .Top)
        
        sendButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        //sendButton.enabled = false
        sendButton.setTitle("Send", forState: .Normal)
        sendButton.addTarget(self, action: "didTapSendButton:", forControlEvents: .TouchUpInside)
        sendButton.setTitleColor(UIColor.sendMessageButtonTintColor(), forState: .Normal)
        sendButton.setTitleColor(UIColor.grayColor(), forState: .Disabled)
        sendButton.setTitleColor(UIColor ( red: 0.6078, green: 0.7176, blue: 0.8706, alpha: 1.0 ), forState: .Highlighted)
        bottomView.addSubview(sendButton)
        
        sendButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(5.0, 0, 5.0, 5.0), excludingEdge: .Left)
        sendButton.autoSetDimension(.Width, toSize: 50.0)
        
        
        messageTextField.layer.borderWidth = 1.0
        messageTextField.layer.borderColor = UIColor.grayColor().CGColor
        messageTextField.layer.cornerRadius = 10.0
        messageTextField.placeholder = " Message"
        messageTextField.delegate = self
        messageTextField.backgroundColor = UIColor.whiteColor()
        bottomView.addSubview(messageTextField)
        
        messageTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(7.5, 5.0, 7.5, 0.0), excludingEdge: .Right)
        messageTextField.autoPinEdge(.Right, toEdge: .Left, ofView: sendButton, withOffset: -5.0)
    }
    
    // MARK: UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessagesTableViewCell
        
        cell.setContent(messageList.messages[indexPath.row])
        
        return cell
    }
    
    // MARK: UITextField Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if let textFieldText = textField.text {
            if (textFieldText.length > 0) && !(textFieldText.elementOfIndex(0) == " ") {
                textField.text = " " + textFieldText
            }
        }
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: Button Actions
    func didTapSendButton(sender: UIButton) {
        messageTextField.resignFirstResponder()
    }
}
