//
//  DataHolder.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation

struct ListHolder<T: Codable>: Codable {
    enum CodingKeys: String, CodingKey {
        case list = "data"
    }

    let list: [T]
}

struct OneHolder<T: Codable>: Codable {
    enum CodingKeys: String, CodingKey {
        case one = "data"
    }

    let one: T
}
