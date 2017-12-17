//
//  FeedController.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class FeedController: TableController<Media, MediaCell> {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadData() {
        APIClient.shared.loadMedia { [weak self] mediaList in
            self?.items = mediaList
            self?.tableView.reloadData()
        }
    }

    override func configure(cell: MediaCell, model: Media) {
        cell.configure(with: model)
        cell.delegate = self
    }
}

extension FeedController: MediaCellDelegate {
    func mediaCell(_ cell: MediaCell, didViewLikes mediaId: String) {

    }

    func mediaCell(_ cell: MediaCell, didViewComments mediaId: String) {

    }

    func mediaCell(_ cell: MediaCell, didSelectUserName userId: String) {

    }
}
