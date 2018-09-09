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
    
    var timer = Timer()
    
    @objc private func fetchCurrencyRates() {
        CurrencyRatesApiService.fetchCurrencyRates { [weak self] (currencyRates, error) in
            if let rates = currencyRates {
                self?.output?.onFetchCurrencyRatesSuccess(currencyRates: rates)
            } else {
                self?.output?.onFetchCurrencyRatesFailure(errorMessage: error?.localizedDescription ?? "Unknown Error")
            }
        }
    }
    
    private func scheduledTimerForFetching(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.fetchCurrencyRates), userInfo: nil, repeats: true)
    }
}

extension ConverterInteractor: ConverterInteractorProtocol {
    
    func startFetchingCurrencyRates() {
        scheduledTimerForFetching()
    }
    
    func stopFetchingCurrencyRate() {
        self.timer.invalidate()
    }
    
    
}
