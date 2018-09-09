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
        presenter?.loadCurrencyRates()
    }
    
    override func onAppWillTerminate() {
        presenter?.stopLoadingCurrencyRates()
    }
    
    override func onAppWillResignActive() {
        presenter?.stopLoadingCurrencyRates()
    }
}

extension ConverterViewController: ConverterViewProtocol {
    
    func updateRates() {
        tableView.reloadData()
    }
    
}

// MARK: Tableview Delegate & DataSource
extension ConverterViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getConverterViewModel().rateViewModels.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRateId", for: indexPath)
        if let currencyRateViewModel = getRateForIndexPath(indexPath) {
            cell.textLabel?.text = "\(currencyRateViewModel.currency!) - \(currencyRateViewModel.currencyDescription!): \(currencyRateViewModel.rate!)"
        }
        
        return cell
    }
    
    private func getRateForIndexPath(_ indexPath: IndexPath) -> RateViewModel? {
        if let rateViewModel = presenter?.getConverterViewModel().rateViewModels[indexPath.row] {
            return rateViewModel
        }
        
        return nil
    }
    
    private func getRatesCount() -> Int {
        if let count = presenter?.getCurrentRates()?.rates.count {
            return count + 1 // need to display base rate as well
        }
        return 0
    }
}
