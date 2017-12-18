//
//  LikesController.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/18.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

class LikesController: TableController<User, UserCell> {

    var mediaId: String!

    func set(mediaId: String) {
        self.mediaId = mediaId
    }

    override func loadData() {
        APIClient.shared.loadUsersWhoLike(mediaId: mediaId) { [weak self] (users) in
            self?.items = users
            self?.tableView.reloadData()
        }
    }

    override func configure(cell: UserCell, model: User) {
        cell.configure(with: model)
    }
}
