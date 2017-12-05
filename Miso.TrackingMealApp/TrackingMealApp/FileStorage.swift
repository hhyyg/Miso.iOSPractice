//
//  FileStorage.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/05.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation

class FileStorage {
    static func store<T>(atPath pathString: String, value: T) throws where T: Encodable {
        let data = try JSONEncoder().encode(value)
        if FileManager.default.fileExists(atPath: pathString) {
            try FileManager.default.removeItem(at: URL(fileURLWithPath: pathString))
        }
        FileManager.default.createFile(atPath: pathString, contents: data, attributes: nil)
    }

    static func retrive<T>(atPath pathString: String) throws -> T? where T: Decodable {
        if let data = FileManager.default.contents(atPath: pathString) {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            return nil
        }
    }
}
