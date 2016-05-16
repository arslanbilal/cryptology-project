//
//  ManInTheMiddleTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 29/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class ManInTheMiddleTableViewController: UITableViewController {
    
    var exitButton: Bool?
    let cellIdentifier = "manInTheMiddleTableViewCell"
    var cipherChatData: [CipherMessage]?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Man in the Middle"
        
        if exitButton! {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: #selector(didTapExitButton(_:)))
        }
        
        tableView.registerClass(ManInTheMiddleTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cipherChatData = ActiveUser.sharedInstance.loadManInTheMiddleData()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cipherChatData!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ManInTheMiddleTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ManInTheMiddleTableViewCell
        
        cell.setContent(cipherChatData![indexPath.row])
        
        return cell
    }
    
    // MARK: - Button Actions
    func didTapExitButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
