//
//  JazzySlideNavigationControllerDelegate.swift
//  JazzySlideKit
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit

@objc
@objcMembers
open class JazzySlideNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    open var pushTransition = JazzySlidePushTransition()
    
    open var popTransition = JazzySlidePopTransition()
    
    open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return pushTransition
        case .pop:
            return popTransition
        case .none:
            return nil
        }
    }
    
}
