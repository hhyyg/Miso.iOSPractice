//
//  UIWindow.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

extension UIWindow: Window {
    var rootView: ViewController? {
        get {
            return self.rootViewController
        }
        set {
            rootViewController = newValue as? UIViewController
        }
    }

}
