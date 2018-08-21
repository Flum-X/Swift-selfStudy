//
//  AppDelegate.swift
//  SwiftProject6
//
//  Created by DaXiong on 2018/8/21.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitVC = window!.rootViewController as! UISplitViewController
        let nav = splitVC.viewControllers[splitVC.viewControllers.count - 1] as! UINavigationController
        nav.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem
        splitVC.delegate = self
        
        UISearchBar.appearance().barTintColor = UIColor.candyGreen()
        UISearchBar.appearance().tintColor = UIColor.white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.candyGreen()
        return true
    }
    
    // MARK: - Split view
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailCandy == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

extension UIColor {
    static func candyGreen() -> UIColor {
        return UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
    }
}

