//
//  MainViewController.swift
//  SwiftProject17
//
//  Created by DaXiong on 2018/11/30.
//  Copyright © 2018 DaXiong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.toolbar.clipsToBounds = true
    }
    //参考（https://www.andrewcbancroft.com/2015/12/18/working-with-unwind-segues-programmatically-in-swift/）
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}
