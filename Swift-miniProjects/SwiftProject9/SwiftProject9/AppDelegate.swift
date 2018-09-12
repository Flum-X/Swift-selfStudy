//
//  AppDelegate.swift
//  SwiftProject9
//
//  Created by DaXiong on 2018/9/2.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: FBMeViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

}

