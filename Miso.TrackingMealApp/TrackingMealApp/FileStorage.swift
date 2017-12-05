//
//  FileStorage.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/05.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation

class FileStorage {

    static let fileManager = FileManager.default

    static func store<T: Encodable>(at url: URL, value: T) throws {
        let data = try JSONEncoder().encode(value)
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(at: url)
        }
        fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
    }

    static func retrive<T: Decodable>(at url: URL) throws -> T? {
        if let data = fileManager.contents(atPath: url.path) {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            return nil
        }
    }
}
