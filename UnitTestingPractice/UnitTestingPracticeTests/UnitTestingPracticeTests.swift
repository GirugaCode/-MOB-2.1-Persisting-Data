//
//  UnitTestingPracticeTests.swift
//  UnitTestingPracticeTests
//
//  Created by Ryan Nguyen on 4/8/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import XCTest
import UIKit
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
    
    func testTitle() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        viewController.viewDidLoad()
        
        XCTAssertEqual("This is a test title", viewController.title)
    }
    
    func testPlaceHolder() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        viewController.viewDidLoad()
        
        XCTAssertEqual("This is a test placeholder", viewController.testTextField.placeholder)
    }
    
    func testVowelsInString() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        viewController.viewDidLoad()
        
        XCTAssertEqual(9, viewController.vowelsInAString(string: "GoCrazyahahahahahahah"))

    }
    
    func testMakeTitle() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        viewController.viewDidLoad()
        
        XCTAssertEqual("The Most Epic Title", viewController.makeTitle(string: "the most epic title"))
    }
}
