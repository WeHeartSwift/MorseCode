//
//  KeyboardViewController.swift
//  MorseCodeKeyboard
//
//  Created by Andrei Puni on 16/06/14.
//  Copyright (c) 2014 Andrei Puni. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {
    
    var nextKeyboardButton: UIButton!
    var dotButton: UIButton!
    var dashButton: UIButton!
    var deleteButton: UIButton!
    var hideKeyboardButton: UIButton!
    
    var customInterface: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let nib = UINib(nibName: "CustomKeyBoard", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as! UIView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customInterface)
        
        addKeyboardButtons()
    }
    
    func addKeyboardButtons() {
        addDot()
        addDash()
        
        addDelete()
        
        addNextKeyboardButton()
        addHideKeyboardButton()
    }
    
    func addNextKeyboardButton() {
        nextKeyboardButton = UIButton(type: .System) as UIButton
        
        nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        view.addSubview(nextKeyboardButton)
        
        
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: +10.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item:nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func addHideKeyboardButton() {
        hideKeyboardButton = UIButton(type: .System) as UIButton
        
        hideKeyboardButton.setTitle("Hide Keyboard", forState: .Normal)
        hideKeyboardButton.sizeToFit()
        hideKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        hideKeyboardButton.addTarget(self, action: "dismissKeyboard", forControlEvents: .TouchUpInside)
        
        view.addSubview(hideKeyboardButton)
        
        let rightSideConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let bottomConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([rightSideConstraint, bottomConstraint])
    }
    
    func addDot() {
        dotButton = UIButton(type: .System) as UIButton
        dotButton.setTitle(".", forState: .Normal)
        dotButton.sizeToFit()
        dotButton.translatesAutoresizingMaskIntoConstraints = false
        dotButton.addTarget(self, action: "didTapDot", forControlEvents: .TouchUpInside)
        
        dotButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        
        dotButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dotButton.layer.cornerRadius = 5
        
        view.addSubview(dotButton)
        
        let dotCenterYConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let dotCenterXConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: -50)
        
        view.addConstraints([dotCenterXConstraint, dotCenterYConstraint])
    }
    
    func addDash() {
        dashButton = UIButton(type: .System) as UIButton
        dashButton.setTitle("_", forState: .Normal)
        dashButton.sizeToFit()
        dashButton.translatesAutoresizingMaskIntoConstraints = false
        dashButton.addTarget(self, action: "didTapDash", forControlEvents: .TouchUpInside)
        
        dashButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        
        dashButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dashButton.layer.cornerRadius = 5
        
        view.addSubview(dashButton)
        
        let dashCenterYConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        let dashCenterXConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: +50)
        
        view.addConstraints([dashCenterXConstraint, dashCenterYConstraint])
    }
    
    func addDelete() {
        deleteButton = UIButton(type: .System) as UIButton
        deleteButton.setTitle(" Delete ", forState: .Normal)
        deleteButton.sizeToFit()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.addTarget(self, action: "didTapDelete", forControlEvents: .TouchUpInside)
        
        deleteButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        deleteButton.layer.cornerRadius = 5
        
        view.addSubview(deleteButton)
        
        let rightSideConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        let topConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: +10.0)
        view.addConstraints([rightSideConstraint, topConstraint])
    }
    
    func didTapDot() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(".")
    }
    
    func didTapDash() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText("_")
    }
    
    func didTapDelete() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
    }
    
    @IBAction func didTapWeheartSwift() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText("We ❤ Swift")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        var textColor: UIColor
        let proxy = textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
}

