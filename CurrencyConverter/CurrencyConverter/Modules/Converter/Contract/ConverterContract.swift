//
//  ConverterContract.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

protocol ConverterViewProtocol: BaseViewProtocol {
    func updateRates()
    
}

protocol ConverterPresentationProtocol: class {
    func getCurrentRates() -> Rates?
    func loadCurrencyRates()
    func convert(_ amount: Double)
}

protocol ConverterInteractorProtocol: class {
    func fetchCurrencyRates()
}

protocol ConverterInteractorOutputProtocol: class {
    func onFetchCurrencyRatesSuccess(currencyRates: Rates)
    func onFetchCurrencyRatesFailure(errorMessage: String)
}

protocol ConverterWireframeProtocol: class {
    // Navigate between screens 
}
