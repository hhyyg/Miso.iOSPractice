//
//  ImageWrapper.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/05.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

public struct UIImageWrapper: Codable {
    public let image: UIImage

    public enum CodingKeys: String, CodingKey {
        case image
    }

    public init(image: UIImage) {
        self.image = image
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode(Data.self, forKey: CodingKeys.image)
        guard let image = UIImage(data: data) else {
            throw AppError(message: "decoding failed")
        }

        self.image = image
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        guard let imageData = UIImagePNGRepresentation(self.image) else {
            throw AppError(message: "encoding failed")
        }

        try container.encode(imageData, forKey: CodingKeys.image)
    }
}
