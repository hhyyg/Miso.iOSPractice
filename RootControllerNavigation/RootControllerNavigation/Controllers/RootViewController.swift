//
//  RootViewController.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var deepLink: DeepLinkType? {
        didSet {
            handleDeepLink()
        }
    }
    private var current: UIViewController = SplashViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }

    private func handleDeepLink() {
        if let mainNavigationController = current as? MainNavigationController,
            let deeplink = deepLink {
            
            self.deepLink = nil
        }
    }
    
    func showLoginScreen() {
        let new = UINavigationController(rootViewController: LoginViewController())
        
        addChildViewController(new)
        new.view.frame = view.bounds //nai
        view.addSubview(new.view) //nai
        new.didMove(toParentViewController: self)
        
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview() //nai
        current.removeFromParentViewController()
        
        current = new
    }
    
    func switchToMainScreen() {
        let mainViewController = MainViewController()
        let new = UINavigationController(rootViewController: mainViewController)
        animateFadeTransition(to: new)
    }
    
    private func animateFadeTransition(to new: UIViewController,
                                       completion: (() -> Void)? = nil) {
        
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {}) { completed in
            
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }
    
    func switchToLogout() {
        let loginViewController = LoginViewController()
        let logoutScreen = UINavigationController(rootViewController: loginViewController)
        
        animateDissmissTransition(to: logoutScreen)
    }
    
    private func animateDissmissTransition(to new: UIViewController,
                                           completion: (() -> Void)? = nil) {
        
        //let initialFrame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
        
    }
    
    
    
    
}
