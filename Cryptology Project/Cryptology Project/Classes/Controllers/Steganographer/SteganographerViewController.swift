//
//  SteganographerViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 15/05/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class SteganographerViewController: UIViewController {
    var exitButton: Bool?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Steganographer"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Done, target: nil, action: nil)
        
        if exitButton! {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"exit.png"), style: .Done, target: self, action: #selector(didTapExitButton(_:)))
        }
        
        loadViews()
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        let hideTextButton = UIButton.newAutoLayoutView()
        hideTextButton.backgroundColor = UIColor.loginViewBackgroundColor()
        hideTextButton.layer.cornerRadius = 15.0
        hideTextButton.setTitle("Hide Text to Image", forState: .Normal)
        hideTextButton.addTarget(self, action: #selector(didTapHideTextButtonButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(hideTextButton)
        
        hideTextButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(15.0, 15.5, 0.0, 15.5), excludingEdge: .Bottom)
        hideTextButton.autoSetDimension(.Height, toSize: 50.0)
        
        
        let showTextButton = UIButton.newAutoLayoutView()
        showTextButton.backgroundColor = UIColor.loginViewBackgroundColor()
        showTextButton.layer.cornerRadius = 15.0
        showTextButton.setTitle("Show Text from Image", forState: .Normal)
        showTextButton.addTarget(self, action: #selector(didTapShowTextButtonButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(showTextButton)
        
        showTextButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.5)
        showTextButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.5)
        showTextButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: hideTextButton, withOffset: 15.0)
        showTextButton.autoSetDimension(.Height, toSize: 50.0)
        
        let compareImageButton = UIButton.newAutoLayoutView()
        compareImageButton.backgroundColor = UIColor.loginViewBackgroundColor()
        compareImageButton.layer.cornerRadius = 15.0
        compareImageButton.setTitle("Compare Image Hashes", forState: .Normal)
        compareImageButton.addTarget(self, action: #selector(didTapCompareImageButtonButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(compareImageButton)
        
        compareImageButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15.5)
        compareImageButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15.5)
        compareImageButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: showTextButton, withOffset: 15.0)
        compareImageButton.autoSetDimension(.Height, toSize: 50.0)
    }
    
    // MARK: - Button Actions
    func didTapExitButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didTapHideTextButtonButton(sender: UIButton) {
        let hideTextViewController = HideTextViewController()
        hideTextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(hideTextViewController, animated: true)
    }
    
    func didTapShowTextButtonButton(sender: UIButton) {
        let showTextViewController = ShowTextViewController()
        showTextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(showTextViewController, animated: true)
    }
    
    func didTapCompareImageButtonButton(sender: UIButton) {
        let compareImagesViewController = CompareImagesViewController()
        compareImagesViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(compareImagesViewController, animated: true)
    }
    
}
