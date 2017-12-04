//
//  Meal.swift
//  Miso.TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/04.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int

    init?(name: String, photo: UIImage?, rating: Int) {

        if (name.isEmpty || rating < 0) {
            return nil
        }

        self.name = name
        self.photo = photo
        self.rating = rating

    }
}
