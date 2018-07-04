//
//  JazzySlideNavigationController.swift
//  JazzySlideKit
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit

@objc
open class JazzySlideNavigationController: UINavigationController {
    
    private var jazzySlideDelegate = JazzySlideNavigationControllerDelegate()
    
    public var pushTransition: JazzySlidePushTransition {
        return jazzySlideDelegate.pushTransition
    }
    
    public var popTransition: JazzySlidePopTransition {
        return jazzySlideDelegate.popTransition
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = jazzySlideDelegate
    }
    
    open override var delegate: UINavigationControllerDelegate? {
        get {
            return jazzySlideDelegate
        }
        set {
            guard let newValue = newValue as? JazzySlideNavigationControllerDelegate else {
                NSLog("Warning: It looks like you are trying to set a value for JazzySlideNavigationController.delegate to something other than an instance of JazzySlideNavigationControllerDelegate. This is an unsupported operation. No action will be performed.")
                return
            }
            jazzySlideDelegate = newValue
            super.delegate = newValue
        }
    }
    
}
