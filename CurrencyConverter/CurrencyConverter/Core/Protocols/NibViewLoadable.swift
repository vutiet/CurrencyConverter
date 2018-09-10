//
//  NibViewLoadable.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import UIKit

protocol NibViewLoadable: class { }

extension NibViewLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}
