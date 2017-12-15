//
//  UIViewController+ViewController.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
extension UIViewController: ViewController {

    var presentedView: ViewController? {
        return presentedViewController
    }

    func present(_ viewControllerToPresent: ViewController) {
        if let viewControllerToPresent = viewControllerToPresent as? UIViewController {
            present(viewControllerToPresent, animated: true, completion: nil)
        }
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

}
