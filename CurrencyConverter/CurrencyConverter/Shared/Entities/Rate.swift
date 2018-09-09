//
//  Rate.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class Rate: Object {
    @objc dynamic private(set) var currency = ""
    @objc dynamic private(set) var rate = 0.0
    
    // MARK: Init methods
//    convenience required init?(map: Map) {
//        self.init()
//        //        self.mapping(map: map)
//    }
    
    convenience public init(currency: String, rate: Double) {
        self.init()
        self.currency = currency
        self.rate = rate
    }
    
    override public static func primaryKey() -> String? {
        return "currency"
    }
    
//    // MARK: Mapping variables
//    func mapping(map: Map) {
//        // TODO: double check
//        currency = [String](map.JSON.keys).first!
//        rate = map.JSON.values.first as! Double
//    }
}

