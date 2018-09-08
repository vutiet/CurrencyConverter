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
    func showLoading(withBackgroundColor backgroundColor: UIColor)
    func hideLoading()
    func showError(_ message: String?)
    func showEmptyView(withMessage message: String, andImageName imageName: String)
    func showEmptyView(withMessage message: String, andImage image: UIImage)
    func addGestureRecognizerToEmptyViewIcon(_ gesture: UITapGestureRecognizer)
    func hideEmptyView()
    func scrollToTopIfNeeded()
    func supportPortraitOnly() -> Bool
}
