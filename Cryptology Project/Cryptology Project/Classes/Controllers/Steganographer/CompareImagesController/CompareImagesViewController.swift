//
//  CompareImagesViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/05/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class CompareImagesViewController: UIViewController {
    
    let originalImageView = UIImageView.newAutoLayoutView()
    let steganoImageView = UIImageView.newAutoLayoutView()
    let compareButton = UIButton.newAutoLayoutView()
    
    let thumbnailImage = UIImage(named: "add")
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Compare Image Hashes"
        
        loadViews()
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        let imageViewsSize = CGSizeMake((UIScreen.mainScreen().bounds.width - 15) / 2, (UIScreen.mainScreen().bounds.width - 15) / 2)
        
        let tapOriginalImageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOriginalImage(_:)))
        tapOriginalImageGestureRecognizer.numberOfTouchesRequired = 1
        tapOriginalImageGestureRecognizer.numberOfTapsRequired = 1
        
        originalImageView.contentMode = .Center
        originalImageView.addGestureRecognizer(tapOriginalImageGestureRecognizer)
        originalImageView.image = thumbnailImage
        originalImageView.tag = 100
        originalImageView.userInteractionEnabled = true
        self.view.addSubview(originalImageView)
        
        originalImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10.0)
        originalImageView.autoPinEdgeToSuperviewEdge(.Left, withInset: 5.0)
        originalImageView.autoSetDimensionsToSize(imageViewsSize)
        
        
        let tapSteganoImageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSteganoImage(_:)))
        tapSteganoImageGestureRecognizer.numberOfTouchesRequired = 1
        tapSteganoImageGestureRecognizer.numberOfTapsRequired = 1
        
        steganoImageView.contentMode = .Center
        steganoImageView.addGestureRecognizer(tapSteganoImageGestureRecognizer)
        steganoImageView.image = thumbnailImage
        steganoImageView.tag = 101
        steganoImageView.userInteractionEnabled = true
        self.view.addSubview(steganoImageView)
        
        steganoImageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10.0)
        steganoImageView.autoPinEdgeToSuperviewEdge(.Right, withInset: 5.0)
        steganoImageView.autoSetDimensionsToSize(imageViewsSize)
        
        
        compareButton.setTitle("Compare Image Hashes", forState: .Normal)
        compareButton.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 19)
        compareButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        compareButton.backgroundColor = UIColor.loginButtonBacgrounColor()
        compareButton.layer.cornerRadius = 10
        compareButton.addTarget(self, action: #selector(didTapCompareButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(compareButton)
        
        compareButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: originalImageView, withOffset: 10.0)
        compareButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        compareButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        compareButton.autoSetDimension(.Height, toSize: 50.0)
    }
    
    // MARK: - Button Actions
    func didTapCompareButton(sender: UIButton) {
        
    }
    
    func didTapOriginalImage(recognizer: UITapGestureRecognizer) {
    }
    
    func didTapSteganoImage(ecognizer: UITapGestureRecognizer) {
        
    }
}
