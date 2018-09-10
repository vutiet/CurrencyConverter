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
    func getCurrentRates() -> CurrencyRates?
    func getConverterViewModel() -> ConverterViewModel
    func loadCurrencyRates()
    func stopLoadingCurrencyRates()
    func convert(currency: String, amount: Double)
    func moveRateViewModelToFirst(_ rateViewModel: CurrencyRateViewModel)
}

protocol ConverterInteractorProtocol: class {
    func startFetchingCurrencyRates()
    func stopFetchingCurrencyRate()
}

protocol ConverterInteractorOutputProtocol: class {
    func onFetchCurrencyRatesSuccess(currencyRates: CurrencyRates)
    func onFetchCurrencyRatesFailure(errorMessage: String)
}

protocol ConverterWireframeProtocol: class {
    // Navigate between screens 
}
