//
//  ConverterPresenter.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ConverterPresenter {

    // MARK: Properties
    weak var view: ConverterViewProtocol?
    var router: ConverterWireframeProtocol?
    var interactor: ConverterInteractorProtocol?
    
    var currencyRates: Rates?
}

extension ConverterPresenter: ConverterPresentationProtocol {
    
    func getCurrentRates() -> Rates? {
        return self.currencyRates
    }
    
    func loadCurrencyRates() {
        interactor?.startFetchingCurrencyRates()
    }
    
    func convert(_ amount: Double) {
        
    }
    
    func stopLoadingCurrencyRates() {
        interactor?.stopFetchingCurrencyRate()
    }
}

extension ConverterPresenter: ConverterInteractorOutputProtocol {
    
    func onFetchCurrencyRatesSuccess(currencyRates: Rates) {
        self.currencyRates = currencyRates
        view?.updateRates()
    }
    
    func onFetchCurrencyRatesFailure(errorMessage: String) {
        // let keep it fail silently for now
        // things can be done here: send error info to GA or similar service
    }
    
}
