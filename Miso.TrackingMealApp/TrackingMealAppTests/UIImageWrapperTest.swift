//
//  UIImageWrapperTest.swift
//  TrackingMealAppTests
//
//  Created by Hiroka Yago on 2017/12/05.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import XCTest
@testable import TrackingMealApp

class UIImageWrapperTest: XCTestCase {

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

    func test_encode() {
        let imageWrapper = UIImageWrapper(image: #imageLiteral(resourceName: "filledStar"))

        //do
        _ = try! JSONEncoder().encode(imageWrapper)
    }

    func test_decode() {

        let imageWrapper = UIImageWrapper(image: #imageLiteral(resourceName: "filledStar"))
        let encoded = try! JSONEncoder().encode(imageWrapper)

        //do
        _ = try! JSONDecoder().decode(UIImageWrapper.self, from: encoded)
    }
}
