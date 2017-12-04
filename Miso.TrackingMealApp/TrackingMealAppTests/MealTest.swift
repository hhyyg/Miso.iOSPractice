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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

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
