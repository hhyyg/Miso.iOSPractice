//
//  MainController.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleLabel()
    }

    private func setTitleLabel() {
        let label = UILabel()
        label.text = "Photo Feed"
        label.textColor  = .black
        label.font = UIFont(name: "Noteworthy-Bold", size: 25)
        navigationItem.titleView = label
    }

}
