//
//  StringExtension.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

extension String {
    func isValidNumberWithTwoDecimalPlaces() -> Bool {
        let regEx = "^[0-9]+([\\.,\\,][0-9]{0,2})?$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    func toDouble() -> Double? {
        if let value = Double(self) {
            return value
        }
        
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        if let decimalString = formatter.number(from: self) {
            return Double(decimalString)
        }
        
        return nil
    }
}
