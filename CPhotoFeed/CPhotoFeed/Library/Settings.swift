//
//  File.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation

struct Settings: Codable {
    var instagramClientId: String
}

class SettingsContainer {
    static var settings: Settings!
}
