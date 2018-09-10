//
//  StringExtensionTests.swift
//  CurrencyConverterTests
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import XCTest
@testable import CurrencyConverter

class StringExtensionTests: XCTestCase {
    
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
    
    func testValidNumberWithTwoDecimalPlaces() {
        let validString1 = "0.00"
        let validString2 = "0,00"
        let validString3 = "10.01"
        let validString4 = "10,01"
        let validString5 = "3.3"
        let validString6 = "3,3"
        let validString7 = "1."
        let validString8 = "1,"
        
        XCTAssertTrue(validString1.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString2.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString3.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString4.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString5.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString6.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString7.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        XCTAssertTrue(validString8.isValidNumberWithTwoDecimalPlaces(), "failed test, should be TRUE")
        
    }
    
    func testInvalidNumberWithTwoDecimalPlaces() {
        let invalidString1 = "0..00"
        let invalidString2 = "0,,00"
        let invalidString3 = "-10.01"
        let invalidString4 = "-10,01"
        let invalidString5 = "e3.3"
        let invalidString6 = "e3,3"
        let invalidString7 = "12.123"
        let invalidString8 = "12,123"
        
        XCTAssertFalse(invalidString1.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString2.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString3.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString4.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString5.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString6.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString7.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
        XCTAssertFalse(invalidString8.isValidNumberWithTwoDecimalPlaces(), "failed test, should be FALSE")
    }
    
    func testToDoubleValid() {
        let validString1 = "0.00"
        let validString2 = "0,00"
        let validString3 = "10.01"
        let validString4 = "10,01"
        let validString5 = "3.3"
        let validString6 = "3,3"
        let validString7 = "1."
        let validString8 = "1,"
        
        XCTAssertTrue(validString1.toDouble() == 0.00, "failed test, should be 0.00")
        XCTAssertTrue(validString2.toDouble() == 0.00, "failed test, should be 0.00")
        XCTAssertTrue(validString3.toDouble() == 10.01, "failed test, should be 10.01")
        XCTAssertTrue(validString4.toDouble() == 10.01, "failed test, should be 10.01")
        XCTAssertTrue(validString5.toDouble() == 3.3, "failed test, should be 3.3")
        XCTAssertTrue(validString6.toDouble() == 3.3, "failed test, should be 3.3")
        XCTAssertTrue(validString7.toDouble() == 1.0, "failed test, should be 1.0")
        XCTAssertTrue(validString8.toDouble() == 1.0, "failed test, should be 1.0")
        
    }
    
    func testToDoubleInvalid() {
        let invalidString1 = "e12"
        let invalidString2 = "0,,00"
        let invalidString3 = "e3.3"
        
        XCTAssertTrue(invalidString1.toDouble() == nil, "failed test, should be nil")
        XCTAssertTrue(invalidString2.toDouble() == nil, "failed test, should be nil")
        XCTAssertTrue(invalidString3.toDouble() == nil, "failed test, should be nil")
        
    }
}
