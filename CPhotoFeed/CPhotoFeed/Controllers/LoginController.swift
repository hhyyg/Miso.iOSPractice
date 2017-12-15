//
//  LoginViewController.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import WebKit
import Anchors

class LoginController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //WebView
        view.addSubview(webView)
        webView.alpha = 0
        activate(webView.anchor.edges)
    }

    @IBAction func loginButtonTouched(_ sender: UIButton) {
        let request = URLRequest(url: APIClient.shared.loginUrl)
        webView.load(request)
        UIView.animate(withDuration: 0.25, animations: {
            self.webView.alpha = 1
        })
    }

}
