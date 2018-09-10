//
//  UIViewExtension.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 11/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>(_ nibName: String? = nil) -> T? {
        var view: T?
        let name: String
        if let validName = nibName {
            name = validName
        } else {
            name = "\(T.self)".components(separatedBy: ".").last!
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
}
