//
//  SplashViewController.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        makeServiceCall()
    }

    private func makeServiceCall() {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            
            if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                AppDelegate.shared.rootViewController.switchToMainScreen()
            } else {
                AppDelegate.shared.rootViewController.switchToLogout()
            }
        }
    }
}
