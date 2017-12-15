//
//  APIClient.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()

    private let clientId = SettingsContainer.settings.instagramClientId
    private let redirectUri = "http://fantageek.com"

    var loginUrl: URL {
        return URL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(clientId)&redirect_uri=\(redirectUri)&response_type=token")!
    }

}
