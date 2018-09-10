//
//  ConverterViewModelTests.swift
//  CurrencyConverterTests
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import XCTest
@testable import CurrencyConverter

class ConverterViewModelTests: XCTestCase {
    
    let converterViewModel = ConverterViewModel()
    var currencyRates = CurrencyRates()
    
    override func setUp() {
        super.setUp()
        currencyRates.base = "EUR"
        currencyRates.rates = ["AUD": 1.6125,
                               "BGN": 1.9511,
                               "BRL": 4.7803,
                               "CAD": 1.5301,
                               "CHF": 1.1248,
                               "CNY": 7.926]
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
    
    
    func testBuildViewModel() {
        let viewModel = ConverterViewModel.build(from: self.currencyRates)
        
        let baseRateViewModel = viewModel.currencyRateViewModels[0] // first item must be base rate
        XCTAssert(baseRateViewModel.currencyCode == "EUR", "wrong base currency, should be EUR")
        XCTAssert(baseRateViewModel.rate == 1.0, "wrong base rate, should be 1.0")
        XCTAssert(baseRateViewModel.amount == 1.0, "wrong base amout, should be 1.0")
        
        for (offset: index, element: (key: key, value: value)) in self.currencyRates.rates.enumerated() {
            let rateViewModel = viewModel.currencyRateViewModels[index+1] // start from 1
            XCTAssert(rateViewModel.currencyCode == key, "wrong base currency, should be \(key)")
            XCTAssert(rateViewModel.rate == value, "wrong base rate, should be \(value)")
            XCTAssert(rateViewModel.amount == value, "wrong base amout, should be \(value)")
        }
    }
    
    func testUpdateViewModel() {
        let amount = 30.0
        let currency = "AUD"
        let rate = 1.6125
        let viewModel = ConverterViewModel.build(from: self.currencyRates)
        viewModel.update(from: self.currencyRates, currency: currency, amount: amount)
        
        let baseRateViewModel = viewModel.currencyRateViewModels[0] // first item should be base rate
        XCTAssert(baseRateViewModel.currencyCode == "EUR", "wrong base currency, should be EUR")
        XCTAssert(baseRateViewModel.rate == 1.0, "wrong base rate, should be 1.0")
        XCTAssert(baseRateViewModel.amount == (amount / rate), "wrong base amout, should be 1.0")
        
        for (offset: index, element: (key: key, value: value)) in self.currencyRates.rates.enumerated() {
            let rateViewModel = viewModel.currencyRateViewModels[index+1] // start from 1
            XCTAssert(rateViewModel.currencyCode == key, "wrong base currency, should be \(key)")
            XCTAssert(rateViewModel.rate == value, "wrong base rate, should be \(value)")
            XCTAssert(rateViewModel.amount == value * amount / rate, "wrong base amout, should be \(value * amount / rate)")
        }
    }
    
    func testMoveToFirst() {
        let viewModel = ConverterViewModel.build(from: self.currencyRates)
        
        let baseRateViewModel = viewModel.currencyRateViewModels[0]
        XCTAssert(baseRateViewModel.currencyCode == "EUR", "wrong currency, should be EUR") // before move
        
        let movedRateViewModel = viewModel.currencyRateViewModels[3]
        viewModel.moveRateViewModelToFirst(movedRateViewModel)
        let firstRateViewModel = viewModel.currencyRateViewModels[0]
        XCTAssert(firstRateViewModel.currencyCode == movedRateViewModel.currencyCode, "wrong currency, should be \(movedRateViewModel.currencyCode!)") // after move
        
        let fourthRateViewModel = viewModel.currencyRateViewModels[3]
        XCTAssert(fourthRateViewModel.currencyCode == "EUR", "wrong currency, should be EUR") // after move
    }
}
