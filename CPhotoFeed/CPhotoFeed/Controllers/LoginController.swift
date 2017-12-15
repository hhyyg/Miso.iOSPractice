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

protocol LoginControllerDelegate: class {
    func loginControllerDidFinish(_ controller: LoginController)
}

class LoginController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    weak var delegate: LoginControllerDelegate?
    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        //WebView
        view.addSubview(webView)
        webView.alpha = 0
        webView.navigationDelegate = self
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

extension LoginController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if let url = navigationAction.request.url,
            url.absoluteString.contains("#access_token") {

            let parts = url.absoluteString.split(separator: "#").last!
            let value = parts.split(separator: "=").last!

            print("accesstoken: \(value)")
            APIClient.shared.accessToken = String(value)
            delegate?.loginControllerDidFinish(self)
        }
        decisionHandler(.allow)
    }
}
