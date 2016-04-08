//
//  ManInTheMiddleTableViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 29/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class ManInTheMiddleTableViewController: UITableViewController {

    let cellIdentifier = "manInTheMiddleTableViewCell"
    let cipherChatData: [CipherMessage] = ActiveUser.sharedInstance.loadManInTheMiddleData()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Man in the Middle"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: #selector(ManInTheMiddleTableViewController.didTapExitButton(_:)))
        
        tableView.registerClass(ManInTheMiddleTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .None
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if cipherChatData.count > 0 {
            let indexPath = NSIndexPath(forItem: cipherChatData.count - 1, inSection: 0)
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        }
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cipherChatData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ManInTheMiddleTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ManInTheMiddleTableViewCell
        
        cell.setContent(cipherChatData[indexPath.row])
        
        return cell
    }

    // MARK: - Button Actions
    func didTapExitButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
