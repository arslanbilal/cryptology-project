//
//  MessagesViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    let cellIdentifier = "messagesTableViewCell"
    let tableView = UITableView.newAutoLayoutView()
    
    private let messageTextField = UITextField.newAutoLayoutView()
    private let sendButton = UIButton.newAutoLayoutView()
    var bottomViewBottomConstraint: [NSLayoutConstraint]!
    
    private let realm = try! Realm()
    
    var messageList: MessageList!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = messageList.otherUser!.name + " " + messageList.otherUser.lastname

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MessagesViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MessagesViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        loadViews()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let count = messageList.messages?.count {
            if count > 0 {
                let indexPath = NSIndexPath(forItem: count - 1, inSection: 0)
                tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            }
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        messageTextField.resignFirstResponder()
    }
    
    // MARK: - UIResponder
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - UI initialisation
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
        
        bottomViewBottomConstraint = bottomView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0), excludingEdge: .Top)
        bottomView.autoSetDimension(.Height, toSize: 50.0)
        
        sendButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        sendButton.setTitle("Send", forState: .Normal)
        sendButton.addTarget(self, action: #selector(MessagesViewController.didTapSendButton(_:)), forControlEvents: .TouchUpInside)
        sendButton.setTitleColor(UIColor.sendMessageButtonTintColor(), forState: .Normal)
        sendButton.setTitleColor(UIColor.grayColor(), forState: .Disabled)
        sendButton.setTitleColor(UIColor ( red: 0.6078, green: 0.7176, blue: 0.8706, alpha: 1.0 ), forState: .Highlighted)
        bottomView.addSubview(sendButton)
        
        sendButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(5.0, 0, 5.0, 5.0), excludingEdge: .Left)
        sendButton.autoSetDimension(.Width, toSize: 50.0)
        
        
        let messageView = UIView.newAutoLayoutView()
        messageView.backgroundColor = UIColor.whiteColor()
        messageView.layer.cornerRadius = 5.0
        bottomView.addSubview(messageView)
        
        messageView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(7.5, 5.0, 7.5, 0.0), excludingEdge: .Right)
        messageView.autoPinEdge(.Right, toEdge: .Left, ofView: sendButton, withOffset: -5.0)
        
        
        messageTextField.placeholder = "Tap here to type message"
        messageTextField.delegate = self
        messageTextField.backgroundColor = UIColor.whiteColor()
        messageView.addSubview(messageTextField)
        
        messageTextField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(1.0, 5.0, 1.0, 5.0))
    }
    
    // MARK: - UITableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  messageList.messages != nil {
            return messageList.messages.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MessagesTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MessagesTableViewCell
        
        cell.setContent(messageList.messages[indexPath.row], messageKey: messageList.messageKey)
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        messageTextField.resignFirstResponder()
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: - Button Actions
    func didTapSendButton(sender: UIButton) {
        
        if let message = messageTextField.text {
            if message.length > 0 {
                
                let key: String! // Key for Chat
                
                if messageList.messageKey != "" { // If there is key
                    key = messageList.messageKey
                } else {
                    key = FBEncryptorAES.generateKey()
                }

                let cipherText = FBEncryptorAES.encryptBase64String(message, keyString: key, separateLines: false)

                let sendingMessage = RealmMessage()
                sendingMessage.id = RealmMessage.messageId
                sendingMessage.text = cipherText
                sendingMessage.date = NSDate()
                
                let chat = RealmChat()
                chat.message = sendingMessage
                chat.fromUser = ActiveUser.sharedInstance.user
                chat.toUser = messageList.otherUser
                
                let chatKey = RealmKey()
                chatKey.id = RealmKey.keyId
                chatKey.key = key
                chat.key = chatKey
                
                
                try! realm.write {
                    realm.add(sendingMessage)
                    realm.add(chat)
                    ActiveUser.sharedInstance.loadUserChatData()
                    messageList = ActiveUser.sharedInstance.getMesageListFromUserId(messageList.otherUser.id)
                    tableView.reloadData()
                    
                    let messageCount = messageList.messages.count - 1
                    let indexPath = NSIndexPath(forItem: messageCount, inSection: 0)
                    tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
                    messageTextField.text = ""
                    self.view.endEditing(true)
                }
            }
        }
        
        messageTextField.resignFirstResponder()
    }
    
    // MARK: - Keyboard State Methods
    func keyboardWillHide(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let _ = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                //key point 0,
                self.bottomViewBottomConstraint[1].constant =  0
                //textViewBottomConstraint.constant = keyboardHeight
                UIView.animateWithDuration(0.25, animations: { () -> Void in self.view.layoutIfNeeded() })
            }
        }
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                self.bottomViewBottomConstraint[1].constant = -1 * keyboardHeight
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
}
