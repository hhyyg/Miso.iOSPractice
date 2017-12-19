//
//  DeepLinkManager.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
import UIKit

class DeepLinkManager {
    static let shared = DeepLinkManager()
    private init() {}
    
    private var deeplinkType: DeepLinkType?
    
    func checkDeepLink() {
        AppDelegate.shared.rootViewController.deepLink = deeplinkType
        self.deeplinkType = nil
    }
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deeplinkType = ShortcutParser.shared.handleShortcut(item)
        return deeplinkType != nil
    }
}
