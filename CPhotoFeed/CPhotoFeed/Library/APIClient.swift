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
    typealias JSONDictionary = [String: Any]

    static let shared = APIClient()

    private let clientId = SettingsContainer.settings.instagramClientId
    private let redirectUri = "http://fantageek.com"

    private static let key_accessToken = "accessToken"

    var parameters: JSONDictionary {
        guard let accessToken = accessToken else {
            return [:]
        }

        return [
            "access_token": accessToken,
            "scope": "follower_list"
        ]
    }

    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: APIClient.key_accessToken)
        }
        set {
            if let newValue = newValue {
                UserDefaults.standard.set(newValue, forKey: APIClient.key_accessToken)
            } else {
                UserDefaults.standard.removeObject(forKey: APIClient.key_accessToken)
            }
        }
    }

    var loginUrl: URL {
        return URL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(clientId)&redirect_uri=\(redirectUri)&response_type=token")!
    }

    func loadMedia(userId: String = "self",
                   completion: @escaping ([Media]) -> Void) {

        request("https://api.instagram.com/v1/users/\(userId)/media/recent", parameters: parameters)
            .responseData(completionHandler: { (response) in
                if let data = response.result.value {
                    do {
                        let holder = try JSONDecoder().decode(ListHolder<Media>.self, from: data)
                        DispatchQueue.main.async {
                            completion(holder.list)
                        }
                    } catch {
                        print(error)
                    }
                }
            })

    }

    func loadUsersWhoLike(mediaId: String, completion: @escaping ([User]) -> Void) {
        request("https://api.instagram.com/v1/media/\(mediaId)/likes",
            parameters: parameters)
            .responseData(completionHandler: { (response) in
                if let data = response.result.value {
                    do {
                        let holder = try JSONDecoder().decode(ListHolder<User>.self, from: data)
                        DispatchQueue.main.async {
                            completion(holder.list)
                        }
                    } catch {
                        print(error)
                    }
                }
            })
    }
}
