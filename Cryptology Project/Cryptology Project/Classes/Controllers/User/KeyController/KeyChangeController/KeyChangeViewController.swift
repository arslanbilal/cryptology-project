//
//  KeyChangeViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 09/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class KeyChangeViewController: UIViewController {

    var messageList: MessageList!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Change Key"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Save, target: self, action: #selector(KeyChangeViewController.didTapSaveButton(_:)))
        
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        // button for generating another key.
        // label for generatd key
    }
    
    // MARK: - Buton Actions
    func didTapSaveButton(sender: UIBarButtonItem) {
        
    }
    
    func didTapKeyGenerateButton(sender: UIButton) {
        
    }
}
