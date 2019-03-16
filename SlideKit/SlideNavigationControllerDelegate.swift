//
//  SlideNavigationControllerDelegate.swift
//  SlideKit
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit

@objc
@objcMembers
open class SlideNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    open var pushTransition: SlideTransition = SlidePushTransition()
    open var popTransition: SlideTransition = SlidePopTransition()
    
    open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
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
