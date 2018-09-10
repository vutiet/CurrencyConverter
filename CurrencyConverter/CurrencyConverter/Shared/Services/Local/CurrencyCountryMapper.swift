//
//  CurrencyCountryMapper.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit
import FlagKit

class CurrencyCountryMapper: NSObject {
    
    static func flag(currencyCode: String?) -> UIImage? {        
        guard let currencyCode = currencyCode else {
            return nil
        }
        
        var countryCode: String?
        if currencyCode == "EUR" {
            countryCode = "EU"
        } else if currencyCode == "USD" {
            countryCode = "US"
        } else {
            let countries = IsoCountryCodes.searchByCurrency(currency: currencyCode)
            if let country = countries.first {
                countryCode = country.alpha2
            }
        }
        
        if let countryCode = countryCode, let flag = Flag(countryCode: countryCode) {
            return flag.image(style: .circle)
        }
    
        return nil
    }
    
    static func currencyName(currencyCode: String?) -> String? {
        if let code = currencyCode {
            return Locale.current.localizedString(forCurrencyCode: code)
        }
        return nil
    }
}
