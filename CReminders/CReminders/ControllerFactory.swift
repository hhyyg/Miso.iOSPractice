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

    let repository: RemindersRepository

    init(repository: RemindersRepository = InMemoryRemindersRepository()) {
        self.repository = repository
    }

    func build(from view: View, router: Router) -> ViewController {

        switch view {
        case .addReminder:
            fatalError()
        case .reminders:

            let controller = RemindersViewController()
            let presenter = RemindersPresenter(view: controller,
                                               router: router,
                                               repository: repository)
            controller.setPresenter(presenter)
            return UINavigationController(rootViewController: controller)
        }
    }
}
