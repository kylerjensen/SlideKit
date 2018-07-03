//
//  ViewController.swift
//  JazzySlideKitTestApp
//
//  Created by Kyler Jensen on 7/3/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit
import JazzySlideKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigationController = navigationController as? JazzySlideNavigationController {
            navigationController.pushTransition.backgroundColor = .white
            navigationController.popTransition.backgroundColor = .white
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

