//
//  RestoTests.swift
//  RestoTests
//
//  Created by Ludovic Ollagnier on 10/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import XCTest
@testable import Resto

class RestoTests: XCTestCase {
    
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
    
    func testAddResto() {
        
        let startCount = RestaurantDirectory.shared.list().count
        let r = Restaurant(name: "Test", address: "", isVisited: true, style: [], grade: 0, menu: [])
        RestaurantDirectory.shared.add(r)
        let endCount = RestaurantDirectory.shared.list().count

        XCTAssert(startCount == endCount - 1)
    }
    
    func testNotifEmmision() {
        
        expectation(forNotification: Constants.Notifications.modelUpdated, object: nil, handler: nil)
        let r = Restaurant(name: "Test", address: "", isVisited: true, style: [], grade: 0, menu: [])
        RestaurantDirectory.shared.add(r)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testAsyncCode() {
        let e = expectation(description: "toto")
        
        e.fulfill()
        
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
