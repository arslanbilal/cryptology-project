//
//  MessagesViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var alertViewController: UIAlertController!
    
    let cellIdentifier = "messagesTableViewCell"
    let tableView = UITableView.newAutoLayoutView()
    
    private let messageTextField = UITextField.newAutoLayoutView()
    private let sendButton = UIButton.newAutoLayoutView()
    private let cameraButton = UIButton.newAutoLayoutView()
    var bottomViewBottomConstraint: [NSLayoutConstraint]!
    
    private let realm = try! Realm()
    
    var messageList: MessageList!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        alertViewController = UIAlertController(title: "Select Source", message: "", preferredStyle: .ActionSheet)
        alertViewController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) in
            self.alertViewController.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            alertViewController.addAction(UIAlertAction(title: "Take a Photo", style: .Default, handler: { (action) in
                self.alertViewController.dismissViewControllerAnimated(true, completion: nil)
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: { })
            }))
        }
        
        alertViewController.addAction(UIAlertAction(title: "Select from Photo Library", style: .Default, handler: { (action) in
            self.alertViewController.dismissViewControllerAnimated(true, completion: nil)
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: { })
        }))
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = messageList.otherUser!.name + " " + messageList.otherUser.lastname
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MessagesViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MessagesViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        loadViews()
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        bottomView.backgroundColor = UIColor ( red: 0.9403, green: 0.9403, blue: 0.9403, alpha: 1.0 )
        self.view.addSubview(bottomView)
        
        bottomViewBottomConstraint = bottomView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0), excludingEdge: .Top)
        bottomView.autoSetDimension(.Height, toSize: 50.0)
        
        
        let bottomTopBorderView = UIView.newAutoLayoutView()
        bottomTopBorderView.backgroundColor = UIColor(red: 0.7331, green: 0.7331, blue: 0.7331, alpha: 1.0)
        bottomView.addSubview(bottomTopBorderView)
        
        bottomTopBorderView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Bottom)
        bottomTopBorderView.autoSetDimension(.Height, toSize: 0.6)
        
        
        sendButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        sendButton.setTitle("Send", forState: .Normal)
        sendButton.addTarget(self, action: #selector(didTapSendButton(_:)), forControlEvents: .TouchUpInside)
        sendButton.setTitleColor(UIColor.sendMessageButtonTintColor(), forState: .Normal)
        sendButton.setTitleColor(UIColor.grayColor(), forState: .Disabled)
        sendButton.enabled = false
        sendButton.setTitleColor(UIColor ( red: 0.6078, green: 0.7176, blue: 0.8706, alpha: 1.0 ), forState: .Highlighted)
        bottomView.addSubview(sendButton)
        
        sendButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(7.5, 0, 7.5, 5.0), excludingEdge: .Left)
        sendButton.autoSetDimension(.Width, toSize: 50.0)
        
        
        cameraButton.setTitle("", forState: .Normal)
        cameraButton.addTarget(self, action: #selector(didTapCameraButton(_:)), forControlEvents: .TouchUpInside)
        cameraButton.setBackgroundImage(UIImage(named: "camera"), forState: .Normal)
        cameraButton.contentMode = .ScaleAspectFit
        bottomView.addSubview(cameraButton)
        
        cameraButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(15.0, 7.5, 15.0, 0.0), excludingEdge: .Right)
        cameraButton.autoSetDimension(.Width, toSize: 30.0)
        
        
        let messageView = UIView.newAutoLayoutView()
        messageView.backgroundColor = UIColor.whiteColor()
        messageView.layer.cornerRadius = 5.0
        messageView.layer.borderWidth = 0.6
        messageView.layer.borderColor = UIColor(red: 0.7331, green: 0.7331, blue: 0.7331, alpha: 1.0).CGColor
        bottomView.addSubview(messageView)
        
        messageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 7.5)
        messageView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 7.5)
        messageView.autoPinEdge(.Left, toEdge: .Right, ofView: cameraButton, withOffset: 7.5)
        messageView.autoPinEdge(.Right, toEdge: .Left, ofView: sendButton, withOffset: -5.0)
        
        
        messageTextField.placeholder = "Tap here to type message"
        messageTextField.delegate = self
        messageTextField.backgroundColor = UIColor.whiteColor()
        messageTextField.addTarget(self, action: #selector(didChangeMessageTextFieldEditing(_:)), forControlEvents: .EditingChanged)
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
        
        cell.setContent(messageList.messages[indexPath.row], messageKey: messageList.messageKey!)
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        messageTextField.resignFirstResponder()
        
        let message: Message = messageList.messages[indexPath.row]
        
        if message.message.isImageMassage {
            
            let text = message.message.text
            let key = messageList.messageKey!.key
            
            let imageDataString = FBEncryptorAES.decryptBase64String(text, keyString: key)
            let image = UIImage(data:FBEncryptorAES.dataForHexString(imageDataString))
            
            let imageInfo = JTSImageInfo()
            imageInfo.image = image
            imageInfo.referenceView = tableView.cellForRowAtIndexPath(indexPath)
            imageInfo.referenceRect = tableView.cellForRowAtIndexPath(indexPath)!.bounds
            
            let imageViewer = JTSImageViewController.init(imageInfo: imageInfo, mode: .Image, backgroundStyle: .Blurred)
            
            imageViewer.showFromViewController(self, transition: .FromOffscreen)
        }
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func didChangeMessageTextFieldEditing(sender: UITextField) {
        sendButton.enabled = sender.text?.length > 0
    }
    
    // MARK: - UIImagePickerController Delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let imageData = UIImageJPEGRepresentation(image, 0.0)
        let imageDataString = FBEncryptorAES.hexStringForData(imageData)
        
        self.createMessageWith(imageDataString, messageType: true)
        
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Button and TextField Actions
    func didTapSendButton(sender: UIButton) {
        
        if let message = messageTextField.text {
            if message.length > 0 {
                self.createMessageWith(message, messageType: false)
            }
        }
        
        messageTextField.resignFirstResponder()
    }
    
    func didTapCameraButton(sender: UIButton) {
        messageTextField.resignFirstResponder()
        
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    // MARK: - Keyboard State Methods
    func keyboardWillHide(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let _ = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                self.bottomViewBottomConstraint[1].constant =  0
                UIView.animateWithDuration(0.25, animations: { () -> Void in self.view.layoutIfNeeded() })
            }
        }
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size.height {
                self.bottomViewBottomConstraint[1].constant = -keyboardHeight
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    // MARK: - Creating a Message
    func createMessageWith(text: String, messageType: Bool) {
        let chatKey: RealmKey!
        
        if messageList.messageKey != nil { // If there is key
            chatKey = realm.objects(RealmKey).filter("key = '\(messageList.messageKey!.key)'").first
        } else {
            chatKey = RealmKey()
            chatKey.id = RealmKey.keyId
            chatKey.key = FBEncryptorAES.generateKey()
        }
        
        let cipherText = FBEncryptorAES.encryptBase64String(text, keyString: chatKey!.key, separateLines: false)
        
        let sendingMessage = RealmMessage()
        sendingMessage.id = RealmMessage.messageId
        sendingMessage.text = cipherText
        sendingMessage.isImageMassage = messageType
        sendingMessage.date = NSDate()
        
        let chat = RealmChat()
        chat.message = sendingMessage
        chat.fromUser = ActiveUser.sharedInstance.user
        chat.toUser = messageList.otherUser
        chat.key = chatKey
        
        try! realm.write {
            realm.add(sendingMessage)
            realm.add(chat)
            ActiveUser.sharedInstance.loadUserChatData()
            messageList = ActiveUser.sharedInstance.getMesageListFromUserId(messageList.otherUser.id)
            
            let messageCount = messageList.messages.count - 1
            let indexPath = NSIndexPath(forItem: messageCount, inSection: 0)
            
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Bottom)
            
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
            
            messageTextField.text = ""
            self.view.endEditing(true)
        }
    }
}
