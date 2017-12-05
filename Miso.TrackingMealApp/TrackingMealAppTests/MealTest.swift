//
//  MealTest.swift
//  Miso.TrackingMealAppTests
//
//  Created by Hiroka Yago on 2017/12/04.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import XCTest
@testable import TrackingMealApp

class MealTest: XCTestCase {

    func test_Meal_Init_Success() {
        let zeroRatingMeal = Meal(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)

        let positiveRatingMeal = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }

    func test_Meal_Init_Fail() {
        let negative = Meal(name: "negative", photo: nil, rating: -1)
        XCTAssertNil(negative)

        let emptyString = Meal(name: "", photo: nil, rating: 3)
        XCTAssertNil(emptyString)

        let large = Meal(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(large)
    }
}
