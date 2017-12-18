//
//  UserCell.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/18.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    func configure(with user: User) {
        avatarImageView.kf.setImage(with: user.avatar)
        usernameButton.setTitle(user.username, for: .normal)
        nameLabel.text = user.name
    }

    @IBAction func usernameButtonTouched(_ sender: UIButton) {

    }
}
