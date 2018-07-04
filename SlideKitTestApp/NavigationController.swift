//
//  NavigationController.swift
//  SlideKitTestApp
//
//  Created by Kyler Jensen on 7/4/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit
import SlideKit

class NavigationController: SlideNavigationController {

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
        navigationBar.backgroundColor = .clear
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        setNavigationBarHidden(true, animated: true)
        self.view.insertSubview(imageView, at: 0)
        self.view.insertSubview(visualEffectView, at: 1)
        self.view.layoutIfNeeded()
    }

}
