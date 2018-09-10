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
    
    private func setupTableView() {
        
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
        return presenter?.getConverterViewModel().currencyRateViewModels.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRateId", for: indexPath)
        if let currencyRateViewModel = getRateForIndexPath(indexPath) {
            cell.textLabel?.text = "\(currencyRateViewModel.currency!) - \(currencyRateViewModel.currencyDescription!): \(currencyRateViewModel.rate!) // \(currencyRateViewModel.amount!)"
            
        }
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let rateViewModel = getRateForIndexPath(indexPath) {
            let topIndexPath = IndexPath(row: 0, section: 0)
            tableView.beginUpdates()
            tableView.moveRow(at: indexPath, to: topIndexPath)
            presenter?.moveRateViewModelToFirst(rateViewModel)
            tableView.endUpdates()
        }
    }
    
    private func getRateForIndexPath(_ indexPath: IndexPath) -> CurrencyRateViewModel? {
        if let rateViewModel = presenter?.getConverterViewModel().currencyRateViewModels[indexPath.row] {
            return rateViewModel
        }
        
        return nil
    }
    
}
