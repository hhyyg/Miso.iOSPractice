//
//  Comment.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
import Foundation

struct Comment: Codable {
    let text: String
    let from: User
}
