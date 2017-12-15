//
//  AppDelegate.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var loginController: LoginController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .black

        try! loadSettings()
        showLogin()

        window?.makeKeyAndVisible()

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
        loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginController") as? LoginController
        //TODO
        window?.rootViewController = loginController!
    }
}
