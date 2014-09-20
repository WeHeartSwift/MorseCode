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

        var nib = UINib(nibName: "CustomKeyBoard", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as UIView
    }

    required init(coder aDecoder: NSCoder) {
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
        nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        view.addSubview(nextKeyboardButton)
        
        
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: +10.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item:nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func addHideKeyboardButton() {
        hideKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        hideKeyboardButton.setTitle("Hide Keyboard", forState: .Normal)
        hideKeyboardButton.sizeToFit()
        hideKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        hideKeyboardButton.addTarget(self, action: "dismissKeyboard", forControlEvents: .TouchUpInside)
        
        view.addSubview(hideKeyboardButton)
        
        var rightSideConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        var bottomConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        view.addConstraints([rightSideConstraint, bottomConstraint])
    }
    
    func addDot() {
        dotButton = UIButton.buttonWithType(.System) as UIButton
        dotButton.setTitle(".", forState: .Normal)
        dotButton.sizeToFit()
        dotButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        dotButton.addTarget(self, action: "didTapDot", forControlEvents: .TouchUpInside)
        
        dotButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        
        dotButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dotButton.layer.cornerRadius = 5
        
        view.addSubview(dotButton)
        
        var dotCenterYConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        var dotCenterXConstraint = NSLayoutConstraint(item: dotButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: -50)
        
        view.addConstraints([dotCenterXConstraint, dotCenterYConstraint])
    }
    
    func addDash() {
        dashButton = UIButton.buttonWithType(.System) as UIButton
        dashButton.setTitle("_", forState: .Normal)
        dashButton.sizeToFit()
        dashButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        dashButton.addTarget(self, action: "didTapDash", forControlEvents: .TouchUpInside)
        
        dashButton.titleLabel!.font = UIFont.systemFontOfSize(32)
        
        dashButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        dashButton.layer.cornerRadius = 5
        
        view.addSubview(dashButton)
        
        var dashCenterYConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        var dashCenterXConstraint = NSLayoutConstraint(item: dashButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: +50)
        
        view.addConstraints([dashCenterXConstraint, dashCenterYConstraint])
    }
    
    func addDelete() {
        deleteButton = UIButton.buttonWithType(.System) as UIButton
        deleteButton.setTitle(" Delete ", forState: .Normal)
        deleteButton.sizeToFit()
        deleteButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        deleteButton.addTarget(self, action: "didTapDelete", forControlEvents: .TouchUpInside)
        
        deleteButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        deleteButton.layer.cornerRadius = 5
        
        view.addSubview(deleteButton)
        
        var rightSideConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        var topConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: +10.0)
        view.addConstraints([rightSideConstraint, topConstraint])
    }
    
    func didTapDot() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText(".")
    }
    
    func didTapDash() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText("_")
    }
    
    func didTapDelete() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
    }
    
    @IBAction func didTapWeheartSwift() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText("We ❤ Swift")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        var textColor: UIColor
        var proxy = textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
}

