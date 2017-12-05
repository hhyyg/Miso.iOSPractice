//
//  Meal.swift
//  Miso.TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/04.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Meal: Codable {
    var name: String
    var photo: UIImageWrapper?
    var rating: Int

    static var archiveUrl: String = {
        var documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        documentDirectory.appendPathComponent("meals")
        return documentDirectory.path
    }()

    init?(name: String, photo: UIImage?, rating: Int) {

        guard !name.isEmpty else {
            return nil
        }

        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        self.name = name
        if let photo = photo {
            self.photo = UIImageWrapper(image: photo)
        }
        self.rating = rating
    }

}
