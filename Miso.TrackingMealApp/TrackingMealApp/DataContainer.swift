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

    static func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")

        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }

        DataContainer.meals += [meal1, meal2, meal3]
    }
}
