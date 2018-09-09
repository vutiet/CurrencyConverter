//
//  BaseViewProtocol.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: class {
    func showLoading()
    func hideLoading()
    func registerNotifications()
    func deregisterNotifications()
    
}
