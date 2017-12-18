//
//  AppDelegate.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import Compass

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var loginController: LoginController?
    private var mainController: MainController?
    private var postLoginRouter = Router()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .black

        try! loadSettings()

        if APIClient.shared.accessToken == nil {
            showLogin()
        } else {
            showMain()
        }

        window?.makeKeyAndVisible()
        setupRouting()

        return true
    }

    func loadSettings() throws {
        //load settings.plist
        let settingURL: URL = URL(fileURLWithPath: Bundle.main.path(forResource: "settings", ofType: "plist")!)
        let data = try Data(contentsOf: settingURL)
        let decoder = PropertyListDecoder()
        SettingsContainer.settings = try decoder.decode(Settings.self, from: data)
    }

    func showLogin() {
        guard let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginController") as? LoginController else {
            fatalError()
        }
        loginController.delegate = self
        mainController = nil
        window?.rootViewController = loginController
    }

    func showMain() {
        guard let mainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainController") as? MainController else {
            fatalError()
        }
        window?.rootViewController = mainController
        self.mainController = mainController
        loginController = nil
    }
}

extension AppDelegate {
    func setupRouting() {

        Navigator.scheme = "photofeed"
        postLoginRouter.routes = [
            "likes:{mediaId}": LikesRoute()
        ]

        Navigator.routes = Array(postLoginRouter.routes.keys)

        Navigator.handle = { [weak self] location in
            guard let selectedController = self?.mainController?.selectedViewController else {
                fatalError()
            }

            let currentController = (selectedController as? UINavigationController)?.topViewController ?? selectedController

            self?.postLoginRouter.navigate(to: location, from: currentController)
        }
    }
}

extension AppDelegate: LoginControllerDelegate {
    func loginControllerDidFinish(_ controller: LoginController) {
        showMain()
    }
}
