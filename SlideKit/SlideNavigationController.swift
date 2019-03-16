//
//  SlideNavigationController.swift
//  SlideKit
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit

@objc
@objcMembers
open class SlideNavigationController: UINavigationController {
    
    private var slideNavigationControllerDelegate = SlideNavigationControllerDelegate()
    
    public var pushTransition: SlideTransition {
        get { return slideNavigationControllerDelegate.pushTransition }
        set { slideNavigationControllerDelegate.pushTransition = newValue }
    }
    
    public var popTransition: SlideTransition {
        get { return slideNavigationControllerDelegate.popTransition }
        set { slideNavigationControllerDelegate.popTransition = newValue }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = slideNavigationControllerDelegate
    }
    
    open override var delegate: UINavigationControllerDelegate? {
        get {
            return slideNavigationControllerDelegate
        }
        set {
            guard let newValue = newValue as? SlideNavigationControllerDelegate else {
                NSLog("Warning: It looks like you are trying to set a value for SlideNavigationController.delegate to something other than an instance of SlideNavigationControllerDelegate. This is an unsupported operation. Please use UINavigationController instead.")
                return
            }
            slideNavigationControllerDelegate = newValue
            super.delegate = newValue
        }
    }
    
}
