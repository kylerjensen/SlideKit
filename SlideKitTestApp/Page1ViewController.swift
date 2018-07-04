//
//  Page1ViewController.swift
//  SlideKitTestApp
//
//  Created by Kyler Jensen on 7/9/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import UIKit
import Foundation

class Page1ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
