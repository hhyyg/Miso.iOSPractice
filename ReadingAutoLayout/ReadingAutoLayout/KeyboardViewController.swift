//
//  KeyboardViewController.swift
//  ReadingAutoLayout
//
//  Created by Hiroka Yago on 2017/12/14.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {

    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboadWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboadWillShow(notification: Notification) {
        guard let info = notification.userInfo else {
            fatalError("Unexpected notification")
        }
        
        guard let keyboardInfo = info[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = info[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardSize = keyboardInfo.cgRectValue.size.height
        
        scrollViewBottomConstraint.constant = keyboardSize
        
        UIView.animate(withDuration: duration, animations: {
            self.view.layoutIfNeeded()
        })
        
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let info = notification.userInfo else {
            fatalError()
        }
        guard let duration = info[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        scrollViewBottomConstraint.constant = 0
        UIView.animate(withDuration: duration, animations: {
            self.view.layoutIfNeeded()
        })
    }

    

}
