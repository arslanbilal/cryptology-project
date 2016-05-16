//
//  HideTextViewController.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/05/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


class HideTextViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate/*, SteganographerDelegate*/ {
    
    let imagePicker = UIImagePickerController()
    var alertViewController: UIAlertController!
    let steganographer = Steganographer()
    
    let textField = UITextField.newAutoLayoutView()
    let hideTextButton = UIButton.newAutoLayoutView()
    let imageView = UIImageView.newAutoLayoutView()
    
    let thumbnailImage = UIImage(named: "add")
    
    var selectedImage: UIImage!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        alertViewController = UIAlertController(title: "Warning", message: "Select Image and Type text for Steganograpy.", preferredStyle: .Alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "Hide Text to Image"
        
        loadViews()
    }
    
    // MARK: - View Initialisation
    func loadViews() {
        let toolsView = UIView.newAutoLayoutView()
        self.view.addSubview(toolsView)
        
        toolsView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(10.0, 5.0, 0.0, 5.0), excludingEdge: .Bottom)
        toolsView.autoSetDimension(.Height, toSize: 50.0)
        
        let textFieldViewWidth = UIScreen.mainScreen().bounds.width - 15
        let textFieldView = UIView.newAutoLayoutView()
        textFieldView.backgroundColor = UIColor.whiteColor()
        textFieldView.layer.cornerRadius = 5.0
        toolsView.addSubview(textFieldView)
        
        textFieldView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Right)
        textFieldView.autoSetDimension(.Width, toSize: textFieldViewWidth * 0.8)
        
        
        textField.delegate = self
        textField.textAlignment = .Left
        textField.placeholder = "enter text here"
        textFieldView.addSubview(textField)
        
        textField.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(2.0, 5.0, 2.0, 5.0))
        
        
        hideTextButton.setTitle("Hide", forState: .Normal)
        hideTextButton.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 19)
        hideTextButton.setTitleColor(UIColor.loginButtonBacgrounColor(), forState: .Normal)
        hideTextButton.layer.cornerRadius = 10
        hideTextButton.addTarget(self, action: #selector(didTapHideTextButton(_:)), forControlEvents: .TouchUpInside)
        toolsView.addSubview(hideTextButton)
        
        hideTextButton.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero, excludingEdge: .Left)
        hideTextButton.autoSetDimension(.Width, toSize: textFieldViewWidth * 0.2)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        let imageViewSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 10, UIScreen.mainScreen().bounds.width - 10)
        
        imageView.contentMode = .Center
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.userInteractionEnabled = true
        imageView.image = thumbnailImage
        self.view.addSubview(imageView)
        
        imageView.autoPinEdge(.Top, toEdge: .Bottom, ofView: toolsView, withOffset: 10)
        imageView.autoAlignAxisToSuperviewAxis(.Vertical)
        imageView.autoSetDimensionsToSize(imageViewSize)
    }
    
    // MARK: - Button Actions
    func didTapHideTextButton(sender: UIButton) {
        textField.resignFirstResponder()
        
        if textField.text?.length > 0 && imageView.image == selectedImage {
            selectedImage = steganographer.encodeMessage(selectedImage, textField.text!)
            UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(self.didFinishSavingImage(_:error:contextInfo:)), nil)
        } else {
            self.presentViewController(self.alertViewController, animated: true, completion: nil)
        }
    }
    
    func didTapImageView(sender: UIImageView) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
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
    
    // MARK: - Save Image Completion
    func didFinishSavingImage(image: UIImage, error: NSError?, contextInfo: UnsafePointer<Void>) {
        let alertViewController = UIAlertController(title: "", message: "", preferredStyle: .Alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        if error == nil {
            alertViewController.title = "Saved!"
            alertViewController.message = "Your image with hidden text has been saved to your photo library!"
        } else {
            alertViewController.title = "Save Error"
            alertViewController.message = error?.localizedDescription
        }
        
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
}
