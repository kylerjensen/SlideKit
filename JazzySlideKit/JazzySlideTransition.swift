//
//  JazzySlideTransition.swift
//  JazzySlideKit
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit

@objc
@objcMembers
open class JazzySlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    @objc
    public enum Mode : Int {
        case horizontalPush
        case horizontalPop
    }
    
    public let mode: Mode
    
    /**
     A mask of options indicating how you want to perform the animations.
     For a list of valid constants, see UIViewAnimationOptions.
     */
    open var animationOptions: UIViewAnimationOptions = [.curveEaseInOut]
    
    /**
     The total duration of the animations, measured in seconds.
     If you specify a negative value or 0, the changes are made without animating them.
     */
    open var animationDuration: TimeInterval = 0.35
    
    /**
     The amount of time (measured in seconds) to wait before beginning the animations.
     Specify a value of 0 to begin the animations immediately.
     */
    open var animationDelay: TimeInterval = 0.0
    
    /**
     The damping ratio for the spring animation as it approaches its quiescent state.
     
     To smoothly decelerate the animation without oscillation, use a value of 1.
     Employ a damping ratio closer to zero to increase oscillation.
     
     When `dampingRatio` is 1, the animation will smoothly decelerate to its final model
     values without oscillating. Damping ratios less than 1 will oscillate more and more
     before coming to a complete stop.
     */
    open var animationSpringDampingRatio: CGFloat = 0.75
    
    /**
     The initial spring velocity. For smooth start to the animation, match this value
     to the view’s velocity as it was prior to attachment.
     
     A value of 1 corresponds to the total animation distance traversed in one second.
     For example, if the total animation distance is 200 points and you want the start
     of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
     
     You can use the initial spring velocity to specify how fast the object at the end
     of the simulated spring was moving before it was attached. It's a unit coordinate
     system, where 1 is defined as travelling the total animation distance in a second.
     So if you're changing an object's position by 200pt in this animation, and you want
     the animation to behave as if the object was moving at 100pt/s before the animation
     started, you'd pass 0.5. You'll typically want to pass 0 for the velocity.
     */
    open var animationSpringDampingInitialVelocity: CGFloat = 0.0
    
    /**
     The background color to set for each transitions' contexts' container view.
     
     The transition context's container view is a view that acts as the superview for the
     views involved in the transition. This view acts as the superview of all other views
     (including those of the presenting and presented view controllers) during the animation
     sequence. UIKit sets this view for you and automatically adds the view of the presenting
     view controller to it. The animator object is responsible for adding the view of the
     presented view controller, and the animator object or presentation controller must use
     this view as the container for all other views involved in the transition.
     */
    open var backgroundColor: UIColor?
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration + animationDelay
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        transitionContext.containerView.backgroundColor = backgroundColor
        transitionContext.containerView.addSubview(toView)
        translate(using: transitionContext, fromView: fromView, toView: toView)
    }
    
    private func translate(using transitionContext: UIViewControllerContextTransitioning, fromView: UIView, toView: UIView) {
        
        var initialTranslation = CGPoint()
        var finalTranslation = CGPoint()
        
        switch mode {
        case .horizontalPush:
            initialTranslation.x = fromView.frame.width
            finalTranslation.x = fromView.frame.width.negated
        case .horizontalPop:
            initialTranslation.x = fromView.frame.width.negated
            finalTranslation.x = fromView.frame.width
        }
        
        toView.frame = fromView.frame
        toView.translateHorizontally(by: initialTranslation.x)
        toView.translateVertically(by: initialTranslation.y)
        
        if #available(iOS 11.0, *) {
            toView.layoutIfNeeded()
        }
        
        let animations: () -> Void = {
            toView.translateHorizontally(by: finalTranslation.x)
            toView.translateVertically(by: finalTranslation.y)
            fromView.translateHorizontally(by: finalTranslation.x)
            fromView.translateVertically(by: finalTranslation.y)
            toView.layoutIfNeeded()
        }
        
        let completion: (Bool) -> Void = {
            transitionContext.completeTransition($0)
        }
        
        UIView.animate(withDuration: animationDuration,
                       delay: animationDelay,
                       usingSpringWithDamping: animationSpringDampingRatio,
                       initialSpringVelocity: animationSpringDampingInitialVelocity,
                       options: animationOptions,
                       animations: animations,
                       completion: completion)
        
    }
    
}

private extension UIView {
    
    func translateHorizontally(by x: CGFloat) {
        frame = frame.applying(CGAffineTransform(translationX: x, y: 0))
    }
    
    func translateVertically(by y: CGFloat) {
        frame = frame.applying(CGAffineTransform(translationX: 0, y: y))
    }
    
}

private extension Numeric {
    
    var negated: Self {
        return 0 - self
    }
    
}
