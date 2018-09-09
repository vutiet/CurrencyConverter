//
//  ListRateTransform.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

struct ListRateTransform: TransformType {
    
    init() { }
    
    typealias Object = List<Rate>
    typealias JSON = [String:Any]
    
    func transformFromJSON(_ value: Any?) -> List<Rate>? {
        if let rates = value as? [String:Any] {
            let list = List<Rate>()
            for (key, value) in rates {
                let valueAsDouble = value as? Double ?? 0.0
                let newRate = Rate(currency: key, rate: valueAsDouble)
                list.append(newRate)
            }
            return list
        }
        
        return nil
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        if let rates = value {
            var results = [String:Any]()
            for rate in rates {
                results[rate.currency] = rate.rate
            }
            return results
        }
        return nil
    }
    
}
