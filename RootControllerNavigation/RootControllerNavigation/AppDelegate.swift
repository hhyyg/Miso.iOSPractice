//
//  AppDelegate.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

extension AppDelegate {
    
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

