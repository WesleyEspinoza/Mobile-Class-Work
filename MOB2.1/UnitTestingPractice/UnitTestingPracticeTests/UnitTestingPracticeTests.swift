//
//  UnitTestingPracticeTests.swift
//  UnitTestingPracticeTests
//
//  Created by Wesley Espinoza on 4/22/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import XCTest
@testable import UnitTestingPractice

class UnitTestingPracticeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testVowelsInAString() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        XCTAssertEqual(1, viewController.vowelsInAString(string: "app"))
    }

    func testMakeTitle() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        XCTAssertEqual("TEStingTEs", viewController.makeTitle(string: "TEStingTEs"))
        
    }
}
