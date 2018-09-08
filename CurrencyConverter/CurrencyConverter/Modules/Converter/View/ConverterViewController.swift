//
//  ConverterViewController.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import UIKit

class ConverterViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: ConverterPresentationProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ConverterViewController: ConverterViewProtocol {
    // TODO: implement view output methods
}
