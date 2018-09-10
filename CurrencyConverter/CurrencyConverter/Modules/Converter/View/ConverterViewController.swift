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
        if let visibleIndexPahts = tableView.indexPathsForVisibleRows {
            let reloadedIndexPaths = visibleIndexPahts.filter { (indexPath) -> Bool in
                indexPath.row != 0
            }
            if reloadedIndexPaths.count > 0 {
                tableView.reloadRows(at: reloadedIndexPaths, with: .automatic)
            } else {
                tableView.reloadData()
            }
        }
    }
    
}

// MARK: Tableview Delegate & DataSource
extension ConverterViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfCurrencyViewModels() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRateId", for: indexPath) as! ConverterCurrencyRateCell
        if let currencyRateViewModel = presenter?.getCurrencyRateViewModel(at: indexPath.row) {
            cell.configure(currencyRateViewModel: currencyRateViewModel)
        }
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectCurrentCurrency(at: indexPath.row)
        
    }
    
    func selectCurrentCurrency(at index: Int) {
        guard index != 0 else {
            return
        }
        if let rateViewModel = presenter?.getCurrencyRateViewModel(at: index) {
            let topIndexPath = IndexPath(row: 0, section: 0)
            let currentIndexPath = IndexPath(row: index, section: 0)
            tableView.beginUpdates()
            tableView.moveRow(at: currentIndexPath, to: topIndexPath)
            tableView.moveRow(at: topIndexPath, to: currentIndexPath)
            presenter?.moveRateViewModelToFirst(rateViewModel)
            tableView.endUpdates()
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            let firstCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ConverterCurrencyRateCell
            firstCell.activateInput()
        }
    }
    
}

// MARK: ConverterCurrencyRateCellDelegate
extension ConverterViewController: ConverterCurrencyRateCellDelegate {
    
    func onCellTextFieldDidBeginEdit(_ cell: ConverterCurrencyRateCell) {
        print("textFieldDidBeginEditing")
        if let indexPath = tableView.indexPath(for: cell) {
            selectCurrentCurrency(at: indexPath.row)
        }
    }
    
    func onCellTextFieldDidEndEdit(_ cell: ConverterCurrencyRateCell) {
        print("textFieldDidEndEditing")
    }
    
    func onCellTextFieldValueDidChange(_ cell: ConverterCurrencyRateCell) {
        print("textFieldValueDidChange: \(cell.amountTextField.text)")
    }

    
}
