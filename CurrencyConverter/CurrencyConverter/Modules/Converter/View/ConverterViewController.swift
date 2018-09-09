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
        return presenter?.getCurrentRates()?.rates.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRateId", for: indexPath)
        if let currencyRate = getRateForIndexPath(indexPath) {
            cell.textLabel?.text = "\(currencyRate.currency): \(currencyRate.rate)"
        }
        
        return cell
    }
    
    private func getRateForIndexPath(_ indexPath: IndexPath) -> Rate? {
        if let rate = presenter?.getCurrentRates()?.rates[indexPath.row] {
            return rate
        }
        return nil
    }
}
