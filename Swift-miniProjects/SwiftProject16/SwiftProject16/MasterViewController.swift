//
//  MasterViewController.swift
//  SwiftProject16
//
//  Created by DaXiong on 2018/11/28.
//  Copyright © 2018 DaXiong. All rights reserved.
//

import UIKit

class MasterViewController: VideoSplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideoBackground()
    }
    
    func setupVideoBackground() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
