//
//  CurrencyRatesApiService.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class CurrencyRatesApiService: NSObject {
    
    static let path = "latest?base=EUR"
    
    public static func fetchCurrencyRates(completion: @escaping ((_ currencyRates: CurrencyRates?, _ error: Error?) -> ())) {
        ApiDataManager.get(path: path, parameters: nil) { (rates, error) in
            completion(rates, error)
        }
    }
}
