//
//  ControllerFactory.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import CRemindersCore
import UIKit

class ControllerFactory {

    init() {

    }

    func build(from view: View, router: Router) -> ViewController {

        switch view {
        case .addReminder:
            fatalError()
        case .reminders:

            let controller = UIViewController()

            return UINavigationController(rootViewController: controller)
        }
    }
}
