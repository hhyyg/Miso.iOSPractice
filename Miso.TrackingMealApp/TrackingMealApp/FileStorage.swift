//
//  FileStorage.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/05.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation

class FileStorage {

    private static let fm = FileManager.default

    static func store<T: Encodable>(at url: URL, value: [T]) {
        let data = try! JSONEncoder().encode(value)
        if fm.fileExists(atPath: url.path) {
            try! fm.removeItem(at: url)
        }
        fm.createFile(atPath: url.path, contents: data, attributes: nil)
    }

    static func retrive<T: Decodable>(at url: URL) -> [T]? {
        if let data = fm.contents(atPath: url.path) {
            return try! JSONDecoder().decode([T].self, from: data)
        } else {
            return nil
        }
    }
}
