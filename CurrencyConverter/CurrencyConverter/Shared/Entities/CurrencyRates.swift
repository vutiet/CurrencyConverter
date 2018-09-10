//
//  Rates.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrencyRates: Mappable {
    var base: String?
    var date: String?
    var rates = [String:Double]()
    
    // MARK: Init methods
    convenience required init?(map: Map) {
        self.init()
    }
    
    // MARK: Mapping variables
    func mapping(map: Map) {
        base <- map["base"]
        date <- map["date"]
        rates <- map["rates"]
    }
}
