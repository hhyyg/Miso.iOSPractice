//
//  MealContainer.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/06.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

struct DataContainer {
    static var meals = [Meal]()

    static func loadFromStorage() {
        meals = FileStorage.retrive(at: Meal.archiveUrl) ?? createSampleMeals()
    }

    static func save() {
        FileStorage.store(at: Meal.archiveUrl, value: meals)
        logger.debug("Meals successfully saved")
    }

    static private func createSampleMeals() -> [Meal] {

        let elements = [
            (name: "Caprese Salad", rating: 4),
            (name: "Chicken and Potatoes", rating: 5),
            (name: "Pasta with Meatballs", rating: 3)
        ]

        let sampleMeals: [Meal] = elements.enumerated().map { (i, element) in

            let (name, rating) = element
            let photo = UIImage(named: "meal\(i + 1)")
            return Meal(name: name, photo: photo, rating: rating)!
        }

        return sampleMeals
    }
}
