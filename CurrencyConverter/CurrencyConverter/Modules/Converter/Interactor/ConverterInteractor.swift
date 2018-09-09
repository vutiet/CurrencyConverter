//
//  ConverterInteractor.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ConverterInteractor {

    // MARK: Properties

    weak var output: ConverterInteractorOutputProtocol?
}

extension ConverterInteractor: ConverterInteractorProtocol {
    
    func fetchCurrencyRates() {
        CurrencyRatesApiService.fetchCurrencyRates { [weak self] (currencyRates, error) in
            if let rates = currencyRates {
                self?.output?.onFetchCurrencyRatesSuccess(currencyRates: rates)
            } else {
                self?.output?.onFetchCurrencyRatesFailure(errorMessage: error?.localizedDescription ?? "Unknown Error")
            }
        }
    }
}
