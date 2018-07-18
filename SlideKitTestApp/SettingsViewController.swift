//
//  SettingsViewController.swift
//  SlideKitTestApp
//
//  Created by Kyler Jensen on 7/18/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit
import SlideKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet var pushTransitionDurationLabel: UILabel!
    @IBOutlet var pushTransitionDurationSlider: UISlider!
    @IBOutlet var pushTransitionDelayLabel: UILabel!
    @IBOutlet var pushTransitionDelaySlider: UISlider!
    @IBOutlet var pushTransitionSpringDampingRatioLabel: UILabel!
    @IBOutlet var pushTransitionSpringDampingRatioSlider: UISlider!
    @IBOutlet var pushTransitionSpringDampingInitialVelocityLabel: UILabel!
    @IBOutlet var pushTransitionSpringDampingInitialVelocitySlider: UISlider!
    
    @IBOutlet var popTransitionDurationLabel: UILabel!
    @IBOutlet var popTransitionDurationSlider: UISlider!
    @IBOutlet var popTransitionDelayLabel: UILabel!
    @IBOutlet var popTransitionDelaySlider: UISlider!
    @IBOutlet var popTransitionSpringDampingRatioLabel: UILabel!
    @IBOutlet var popTransitionSpringDampingRatioSlider: UISlider!
    @IBOutlet var popTransitionSpringDampingInitialVelocityLabel: UILabel!
    @IBOutlet var popTransitionSpringDampingInitialVelocitySlider: UISlider!
    
    var pushTransition: SlideTransition {
        return (navigationController as! SlideNavigationController).pushTransition
    }
    
    var popTransition: SlideTransition {
        return (navigationController as! SlideNavigationController).popTransition
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "BackgroundPattern")!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.clipsToBounds = true
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        visualEffectView.frame = view.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        visualEffectView.clipsToBounds = true
        visualEffectView.layer.opacity = 0.7
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.view.insertSubview(imageView, at: 0)
        navigationController?.view.insertSubview(visualEffectView, at: 1)
        navigationController?.view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.pushTransitionDurationLabel.text = String(format: "%.2f", self.pushTransition.duration)
            self.pushTransitionDurationSlider.value = Float(self.pushTransition.duration)
            self.pushTransitionDelayLabel.text = String(format: "%.2f", self.pushTransition.delay)
            self.pushTransitionDelaySlider.value = Float(self.pushTransition.delay)
            self.pushTransitionSpringDampingRatioLabel.text = String(format: "%.2f", self.pushTransition.springDampingRatio)
            self.pushTransitionSpringDampingRatioSlider.value = Float(self.pushTransition.springDampingRatio)
            self.pushTransitionSpringDampingInitialVelocityLabel.text = String(format: "%.2f", self.pushTransition.springDampingInitialVelocity)
            self.pushTransitionSpringDampingInitialVelocitySlider.value = Float(self.pushTransition.springDampingInitialVelocity)
            
            self.popTransitionDurationLabel.text = String(format: "%.2f", self.popTransition.duration)
            self.popTransitionDurationSlider.value = Float(self.popTransition.duration)
            self.popTransitionDelayLabel.text = String(format: "%.2f", self.popTransition.delay)
            self.popTransitionDelaySlider.value = Float(self.popTransition.delay)
            self.popTransitionSpringDampingRatioLabel.text = String(format: "%.2f", self.popTransition.springDampingRatio)
            self.popTransitionSpringDampingRatioSlider.value = Float(self.popTransition.springDampingRatio)
            self.popTransitionSpringDampingInitialVelocityLabel.text = String(format: "%.2f", self.popTransition.springDampingInitialVelocity)
            self.popTransitionSpringDampingInitialVelocitySlider.value = Float(self.popTransition.springDampingInitialVelocity)
        }
    }
    
    @IBAction func pushTransitionDurationChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.pushTransitionDurationLabel.text = String(format: "%.2f", sender.value)
            self.pushTransition.duration = TimeInterval(sender.value)
        }
    }
    
    @IBAction func pushTransitionDelayChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.pushTransitionDelayLabel.text = String(format: "%.2f", sender.value)
            self.pushTransition.delay = TimeInterval(sender.value)
        }
    }
    
    @IBAction func pushTransitionSpringDampingRatioChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.pushTransitionSpringDampingRatioLabel.text = String(format: "%.2f", sender.value)
            self.pushTransition.springDampingRatio = CGFloat(sender.value)
        }
    }
    
    @IBAction func pushTransitionSpringDampingInitialVelocityChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.pushTransitionSpringDampingInitialVelocityLabel.text = String(format: "%.2f", sender.value)
            self.pushTransition.springDampingInitialVelocity = CGFloat(sender.value)
        }
    }
    
    @IBAction func popTransitionDurationChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.popTransitionDurationLabel.text = String(format: "%.2f", sender.value)
            self.popTransition.duration = TimeInterval(sender.value)
        }
    }
    
    @IBAction func popTransitionDelayChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.popTransitionDelayLabel.text = String(format: "%.2f", sender.value)
            self.popTransition.delay = TimeInterval(sender.value)
        }
    }
    
    @IBAction func popTransitionSpringDampingRatioChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.popTransitionSpringDampingRatioLabel.text = String(format: "%.2f", sender.value)
            self.popTransition.springDampingRatio = CGFloat(sender.value)
        }
    }
    
    @IBAction func popTransitionSpringDampingInitialVelocityChanged(_ sender: UISlider) {
        DispatchQueue.main.async {
            self.popTransitionSpringDampingInitialVelocityLabel.text = String(format: "%.2f", sender.value)
            self.popTransition.springDampingInitialVelocity = CGFloat(sender.value)
        }
    }
    
}

