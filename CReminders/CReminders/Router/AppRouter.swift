//
//  AppRouter.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import CRemindersCore

class AppRouter: Router {

    private var controller: ViewController?
    private var window: Window
    private let controllerFactory: ControllerFactory

    init(window: Window,
         controllerFactory: ControllerFactory = ControllerFactory()) {

        self.window = window
        self.controllerFactory = controllerFactory
    }

    func route(to view: View) {
        switch view {
        case .addReminder:
            fatalError()
        case .reminders:

            if window.rootView != nil {
                controller?.dismiss()
            } else {
                window.rootView = controllerFactory.build(from: view, router: self)
            }
            controller = window.rootView

        }
    }
}
