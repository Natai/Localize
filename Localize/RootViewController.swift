//
//  RootViewController.swift
//
//  Created by natai on 2020/4/2.
//  
//  Copyright © 2020 bibr. All rights reserved.
//
    

import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("根视图", comment: "根视图")
    }
    
    @IBAction func pushFirst(_ sender: Any) {
        let controller = FirstViewController()
        show(controller, sender: nil)
    }
}
