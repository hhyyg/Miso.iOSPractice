//
//  MediaCell.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

protocol MediaCellDelegate: class {
    func mediaCell(_ cell: MediaCell, didViewLikes mediaId: String)
    func mediaCell(_ cell: MediaCell, didViewComments mediaId: String)
    func mediaCell(_ cell: MediaCell, didSelectUserName userId: String)
}

class MediaCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
    
    
    
    private var media: Media?
    weak var delegate: MediaCellDelegate?

    func configure(with media: Media) {
        self.media = media

    }

}
