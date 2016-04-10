//
//  KeyChangeViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 09/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class KeyChangeViewController: UIViewController {

    var messageList: MessageList!
    private let keyLabel = UILabel.newAutoLayoutView()
    private let keyGeneratorButton = UIButton.newAutoLayoutView()
    private var generatedKey = ""
    private let realm = try! Realm()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Change Key"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Save, target: self, action: #selector(KeyChangeViewController.didTapSaveButton(_:)))
        
        loadViews()
        generatedKey = messageList.messageKey!.key
        keyLabel.text = "Your key with \(messageList.otherUser.username) is:\n" + "\(generatedKey)"
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        // button for generating another key.
        // label for generatd key
        
        keyLabel.numberOfLines = 3
        keyLabel.textColor = UIColor.blackColor()
        keyLabel.textAlignment = .Left
        keyLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        self.view.addSubview(keyLabel)
        
        keyLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(20.0, 10.0, 0.0, 10.0), excludingEdge: .Bottom)
        keyLabel.autoSetDimension(.Height, toSize: 60)
        
        keyGeneratorButton.backgroundColor = UIColor.loginViewBackgroundColor()
        keyGeneratorButton.layer.cornerRadius = 15.0
        keyGeneratorButton.setTitle("Generate New Key", forState: .Normal)
        keyGeneratorButton.addTarget(self, action: #selector(KeyChangeViewController.didTapKeyGeneratorButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(keyGeneratorButton)
        
        keyGeneratorButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.5)
        keyGeneratorButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.5)
        keyGeneratorButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: keyLabel, withOffset: 30.0)
        keyGeneratorButton.autoSetDimension(.Height, toSize: 50.0)
    }
    
    // MARK: - Buton Actions
    func didTapSaveButton(sender: UIBarButtonItem) {
        if generatedKey == messageList.messageKey!.key {
            showAlertView("Key Changed!", message: "", style: .Alert)
        } else {
            // yeni keey!
            
            try! realm.write {
                for i in 0 ..< messageList.messages.count {
                    let encryptedMessage = messageList.messages[i].message.text
                    
                    let decryptedMessage = FBEncryptorAES.decryptBase64String(encryptedMessage, keyString: messageList.messageKey!.key)
                    let newEncryptedMessage = FBEncryptorAES.encryptBase64String(decryptedMessage, keyString: generatedKey, separateLines: false)
                    
                    messageList.messages[i].message.text = newEncryptedMessage
                }
                messageList.messageKey!.key = generatedKey
                showAlertView("Key Changed!", message: "", style: .Alert)
            }
        }
    }
    
    func didTapKeyGeneratorButton(sender: UIButton) {
        generatedKey = FBEncryptorAES.generateKey()
        keyLabel.text = "New key with \(messageList.otherUser.username) is:\n" + generatedKey
    }
    
    // MARK: - AlertViewInitialise
    func showAlertView(title: String, message: String, style: UIAlertControllerStyle) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: style)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { _ in
            self.navigationController?.popViewControllerAnimated(true)
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
