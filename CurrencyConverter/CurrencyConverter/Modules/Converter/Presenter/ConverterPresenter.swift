//
//  ConverterPresenter.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ConverterPresenter {

    // MARK: Properties

    weak var view: ConverterViewProtocol?
    var router: ConverterWireframeProtocol?
    var interactor: ConverterInteractorProtocol?
}

extension ConverterPresenter: ConverterPresentationProtocol {
    // TODO: implement presentation methods
}

extension ConverterPresenter: ConverterInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
