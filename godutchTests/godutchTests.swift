//
//  godutchTests.swift
//  godutchTests
//
//  Created by 方又生 on 2017/10/17.
//  Copyright © 2017年 方又生. All rights reserved.
//

import XCTest
@testable import godutch

class godutchTests: XCTestCase {
    
    func testMealInitializationSucceeds() {
        let zeroRatingMeal = Group.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let positiveRatingMeal = Group.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
        let largeRatingMeal = Group.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
}
