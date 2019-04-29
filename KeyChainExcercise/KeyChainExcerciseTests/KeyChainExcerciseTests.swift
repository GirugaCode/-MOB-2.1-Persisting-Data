//
//  KeyChainExcerciseTests.swift
//  KeyChainExcerciseTests
//
//  Created by Ryan Nguyen on 4/29/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import XCTest
import KeychainSwift
@testable import KeyChainExcercise

class KeyChainExcerciseTests: XCTestCase {
    let keychain = KeychainSwift()
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        keychain.set("yeet", forKey: "myKey")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testKeychainGet() {
        // Test if retrieving a value with Keychain works.
        let testText = keychain.get("myKey")
        XCTAssertEqual(testText, "yeet")
        
    }
    
    func testKeychainDelete() {
        // Test if deleting a value with Keychain works.
        keychain.delete("myKey")
        
        let deletedValue: String? = keychain.get("myKey")
        
        XCTAssertNil(deletedValue)
        
    }
    
    func testKeychainUpdate() {
        // Test if updating a value with Keychain works, you will need an initial value and compare the new value with the old one.
        keychain.set("UpdatedTest", forKey: "myKey")
        let newValue = keychain.get("myKey")
        XCTAssertEqual(newValue, "UpdatedTest")
    }

}
