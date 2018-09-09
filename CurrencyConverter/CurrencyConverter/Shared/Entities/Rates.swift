//
//  Rates.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

//class Rates: Object, Mappable {
//    @objc dynamic private(set) var base: String?
//    @objc dynamic private(set) var date: String?
//    private(set) var rates = List<Rate>()
//
//    // MARK: Init methods
//    convenience required init?(map: Map) {
//        self.init()
//    }
//
//    override static func primaryKey() -> String? {
//        return "base"
//    }
//
//    // MARK: Mapping variables
//    func mapping(map: Map) {
//        base <- map["base"]
//        date <- map["date"]
//        rates <- (map["rates"], ListRateTransform())
//    }
//}

class Rates: Mappable {
    var base: String?
    var date: String?
    var rates = [String:Double]()
    
    // MARK: Init methods
    convenience required init?(map: Map) {
        self.init()
    }
    
//    override static func primaryKey() -> String? {
//        return "base"
//    }
    
    // MARK: Mapping variables
    func mapping(map: Map) {
        base <- map["base"]
        date <- map["date"]
        rates <- map["rates"]
    }
}
