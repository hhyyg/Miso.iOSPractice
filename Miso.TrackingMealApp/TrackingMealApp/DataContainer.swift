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
            (name: "Caprese Salad", photoName: "meal1", rating: 4),
            (name: "Chicken and Potatoes", photoName: "meal2", rating: 5),
            (name: "Pasta with Meatballs", photoName: "meal3", rating: 3)
        ]

        let sampleMeals: [Meal] = elements.map { (name, photoName, rating) in

            let photo = UIImage(named: photoName)
            guard let meal = Meal(name: name, photo: photo, rating: rating) else {
                fatalError("Unable to instantiate:\(name)")
            }
            return meal
        }

        return sampleMeals
    }
}
