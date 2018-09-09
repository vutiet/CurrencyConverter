//
//  ConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ConverterViewModel {
    var rateViewModels = [RateViewModel]()
    
    static func build(from rates: Rates) -> ConverterViewModel {
        let viewModel = ConverterViewModel()
        
        let baseRateViewModel = RateViewModel(nationFlag: "", currencyDescription: "Euro", currency: rates.base, rate: 1.00)
        viewModel.rateViewModels.append(baseRateViewModel)
        for (key, value) in rates.rates {
            let newRateModel = RateViewModel(nationFlag: "", currencyDescription: key, currency: key, rate: value)
            viewModel.rateViewModels.append(newRateModel)
        }
        return viewModel
    }
    
    func update(from rates: Rates) {
        for i in 0..<rateViewModels.count {
            if let currency = rateViewModels[i].currency {
                if currency == rates.base {
                    rateViewModels[i].rate = 1.00
                } else {
                    rateViewModels[i].rate = rates.rates[currency]
                }
            }
        }
    }
    
    func moveRateViewModelToFirst(_ rateViewModel: RateViewModel) {
        if let index = rateViewModels.index(where: { $0.currency == rateViewModel.currency }) {
            self.rateViewModels.swapAt(0, index)
        }
    }
}
