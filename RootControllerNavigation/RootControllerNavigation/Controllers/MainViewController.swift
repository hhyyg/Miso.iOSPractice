//
//  MainViewController.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        title = "Main Screen"
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
        
        let activityButton = UIBarButtonItem(title: "Activity", style: .plain, target: self , action: #selector(showActivityScreen(animated:)))
        navigationItem.setRightBarButton(activityButton, animated: true)
    }
    
    @objc
    private func logout() {
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        
        AppDelegate.shared.rootViewController.switchToLogout()
    }
    
    @objc
    func showActivityScreen(animated: Bool = true) {
        let activityViewControler = ActivityViewController()
        navigationController?.pushViewController(activityViewControler, animated: animated)
    }
}
