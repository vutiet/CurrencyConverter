//
//  ConverterRouter.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation
import UIKit

class ConverterRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> ConverterViewController {
        let viewController = UIStoryboard.loadViewController() as ConverterViewController
        let presenter = ConverterPresenter()
        let router = ConverterRouter()
        let interactor = ConverterInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension ConverterRouter: ConverterWireframeProtocol {
    // Implement wireframe methods here
    // to navigate to next screen
}
