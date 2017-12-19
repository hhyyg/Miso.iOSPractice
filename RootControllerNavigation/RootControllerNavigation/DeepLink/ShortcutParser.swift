//
//  ShortcutParser.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
import UIKit

class ShortcutParser {
    static let shared = ShortcutParser()
    private init() {}    
    
    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeepLinkType? {
        
        switch shortcut.type {
        case ShortcutKey.activity.rawValue:
            return .activity
        case ShortcutKey.messages.rawValue:
            return .messages(.root)
        default:
                return nil
        }
    }
}
