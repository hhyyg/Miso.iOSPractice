//
//  MediaCell.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import Kingfisher

protocol MediaCellDelegate: class {
    func mediaCell(_ cell: MediaCell, didViewLikes mediaId: String)
    func mediaCell(_ cell: MediaCell, didViewComments mediaId: String)
    func mediaCell(_ cell: MediaCell, didSelectUserName userId: String)
}

class MediaCell: UITableViewCell {

    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var contextButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bookmardButton: UIButton!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usersWhoLikeButton: UIButton!
    @IBOutlet weak var userWhoCommentButton: UIButton!

    private var media: Media?
    weak var delegate: MediaCellDelegate?

    func configure(with media: Media) {
        self.media = media

        avatarImageView.kf.setImage(with: media.user.avatar)
        userButton.setTitle(media.user.name, for: .normal)
        locationLabel.text = media.location?.name ?? ""
        mediaImageView.kf.setImage(with: media.images.standard.url)
        usersWhoLikeButton.setTitle("\(media.likes.count) likes", for: .normal)
        usersWhoLikeButton.setTitleColor(.lightGray, for: .normal)
        userWhoCommentButton.setTitle("View all \(media.comments.count)", for: .normal)
        userWhoCommentButton.setTitleColor(.lightGray, for: .normal)
        captionLabel.text = media.caption?.text ?? ""
    }

    @IBAction func viewLikeButtonTouched(_ sender: UIButton) {
    }

    @IBAction func viewCommentButtonTouched(_ sender: UIButton) {
    }
    @IBAction func usernameButtonTouched(_ sender: UIButton) {
    }

}
