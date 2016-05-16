//
//  ShowTextViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/05/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class ShowTextViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var alertViewController: UIAlertController!
    let steganographer = Steganographer()
    
    let imageView = UIImageView.newAutoLayoutView()
    let showTextButton = UIButton.newAutoLayoutView()
    
    let thumbnailImage = UIImage(named: "add")
    var selectedImage: UIImage!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        alertViewController = UIAlertController(title: "Warning", message: "Select Image for Steganograpy.", preferredStyle: .Alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Show Text from Image"
        
        loadViews()
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        let imageViewSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 10, UIScreen.mainScreen().bounds.width - 10)
        imageView.contentMode = .Center
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.image = thumbnailImage
        self.view.addSubview(imageView)
        
        imageView.autoPinEdgeToSuperviewEdge(.Top, withInset: 10.0)
        imageView.autoAlignAxisToSuperviewAxis(.Vertical)
        imageView.autoSetDimensionsToSize(imageViewSize)
        
        
        showTextButton.setTitle("Show Text", forState: .Normal)
        showTextButton.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 19)
        showTextButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        showTextButton.backgroundColor = UIColor.loginButtonBacgrounColor()
        showTextButton.layer.cornerRadius = 10
        showTextButton.addTarget(self, action: #selector(didTapShowTextButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(showTextButton)
        
        showTextButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: imageView, withOffset: 10.0)
        showTextButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 10.0)
        showTextButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 10.0)
        showTextButton.autoSetDimension(.Height, toSize: 50.0)
    }
    
    // MARK: - UIImagePickerController Delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.contentMode = .ScaleAspectFit
        imageView.image = selectedImage
        
        self.imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Button Actions
    func didTapShowTextButton(sender: UIButton) {
        if imageView.image == selectedImage {
            var text = steganographer.decodeMessage(selectedImage)
            
            if text == nil {
                text = "The is no message inside the image!"
            }
            
            let alertViewController = UIAlertController(title: "Text From Image:", message: text, preferredStyle: .Alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertViewController, animated: true, completion: nil)
        } else {
            self.presentViewController(self.alertViewController, animated: true, completion: nil)        }
    }
    
    func didTapImageView(sender: UIImageView) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
}
