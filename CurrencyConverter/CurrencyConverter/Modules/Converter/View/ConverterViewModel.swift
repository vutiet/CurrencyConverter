//
//  ConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ConverterViewModel {
    static let baseRate = 1.0
    var currencyRateViewModels = [CurrencyRateViewModel]()
    
    static func build(from currencyRates: CurrencyRates) -> ConverterViewModel {
        let viewModel = ConverterViewModel()
        let baseRateViewModel = CurrencyRateViewModel(nationFlag: "", currencyDescription: "Euro", currency: currencyRates.base, rate: baseRate, amount: baseRate)
        viewModel.currencyRateViewModels.append(baseRateViewModel)
        for (key, value) in currencyRates.rates {
            let newRateModel = CurrencyRateViewModel(nationFlag: "", currencyDescription: key, currency: key, rate: value, amount: value)
            viewModel.currencyRateViewModels.append(newRateModel)
        }
        return viewModel
    }
    
    func update(from currencyRates: CurrencyRates, currency: String, amount: Double) {
        for i in 0..<currencyRateViewModels.count {
            if let iCurrency = currencyRateViewModels[i].currency {
                if iCurrency == currencyRates.base {
                    currencyRateViewModels[i].rate = ConverterViewModel.baseRate
                } else {
                    currencyRateViewModels[i].rate = currencyRates.rates[iCurrency]
                    
                }
                
                if let rateOfCurrency = currencyRates.rates[currency] {
                    currencyRateViewModels[i].amount = convert(amount: amount, fromCurrencyRate: rateOfCurrency, toCurrencyRate: currencyRateViewModels[i].rate!)
                } else if currency == currencyRates.base {
                    currencyRateViewModels[i].amount = convert(amount: amount, fromCurrencyRate: ConverterViewModel.baseRate, toCurrencyRate: currencyRateViewModels[i].rate!)
                }
            }
        }
    }
    
    private func convert(amount: Double, fromCurrencyRate: Double, toCurrencyRate: Double) -> Double {
        return (amount * toCurrencyRate) / fromCurrencyRate
    }
    
    func moveRateViewModelToFirst(_ rateViewModel: CurrencyRateViewModel) {
        if let index = currencyRateViewModels.index(where: { $0.currency == rateViewModel.currency }) {
            self.currencyRateViewModels.swapAt(0, index)
        }
    }
}
