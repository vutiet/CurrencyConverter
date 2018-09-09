//
//  ApiDataManager.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 09/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ApiDataManager: NSObject {
    
    static let hostName = "https://revolut.duckdns.org"
    
    private class func requestUrl(for path: String) -> String? {
        return "\(hostName)/\(path)"
    }
    
    class func get<T: Mappable>(path: String, parameters: Parameters?, completion: @escaping ((_ response: T?, _ error: Error?) -> ())) {
        let url = self.requestUrl(for: path)
        get(url: url!, parameters: parameters, completion: { (response, error) in
            completion(response, error)
        })
    }
    
    class func get<T: Mappable>(url: String, parameters: Parameters?, completion: @escaping ((_ response: T?, _ error: Error?) -> ())) {
        let fullUrl: String! = url
        Alamofire
            .request(fullUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseObject(completionHandler: { (response: DataResponse<T>) in
                switch response.result {
                case .success:
                    completion(response.result.value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            })
    }
    
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================")
        debugPrint(self)
        debugPrint("================================================================================")
        #endif
        return self
    }
}
