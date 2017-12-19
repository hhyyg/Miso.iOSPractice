//
//  LoginViewController.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Login Screen"
        
        let loginButton = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(login))
        navigationItem.setLeftBarButton(loginButton, animated: true)
    }
    
    @objc
    private func login() {
        UserDefaults.standard.set(true, forKey: "LOGGED_IN")
        
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }
}
