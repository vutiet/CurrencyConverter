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
    
    var currencyRates: CurrencyRates?
    var converterViewModel: ConverterViewModel?
    var currentAmount: Double = 1.0
    var currentCurrency: String = "EUR"
}

extension ConverterPresenter: ConverterPresentationProtocol {
    
    func getCurrentRates() -> CurrencyRates? {
        return self.currencyRates
    }
    
    func loadCurrencyRates() {
        view?.showLoading()
        interactor?.startFetchingCurrencyRates()
    }
    
    func getNumberOfCurrencyViewModels() -> Int {
        return self.converterViewModel?.currencyRateViewModels.count ?? 0
    }
    
    func getCurrencyRateViewModel(at index: Int) -> CurrencyRateViewModel? {
        return self.converterViewModel?.currencyRateViewModels[index]
    }
    
    func convert(currency: String, amount: Double) {
        self.currentAmount = amount
        self.currentCurrency = currency
        if let currencyRates = self.currencyRates {
            self.converterViewModel?.update(from: currencyRates, currency: self.currentCurrency, amount: self.currentAmount)
            view?.updateRates()
        }
    }
    
    func stopLoadingCurrencyRates() {
        interactor?.stopFetchingCurrencyRate()
    }
    
    func moveRateViewModelToFirst(_ rateViewModel: CurrencyRateViewModel) {
        self.converterViewModel?.moveRateViewModelToFirst(rateViewModel)
    }
}

extension ConverterPresenter: ConverterInteractorOutputProtocol {
    
    func onFetchCurrencyRatesSuccess(currencyRates: CurrencyRates) {
        self.currencyRates = currencyRates
        if (converterViewModel == nil) {
            self.converterViewModel = ConverterViewModel.build(from: self.currencyRates!)
        } else {
            self.converterViewModel?.update(from: self.currencyRates!, currency: self.currentCurrency, amount: self.currentAmount)
        }
        view?.hideLoading()
        view?.updateRates()
    }
    
    func onFetchCurrencyRatesFailure(errorMessage: String) {
        // let keep it fail silently for now
        // things can be done here: send error info to GA or similar service
    }
    
}
