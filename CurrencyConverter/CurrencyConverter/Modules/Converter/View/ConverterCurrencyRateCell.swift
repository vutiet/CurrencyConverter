//
//  ConverterCurrencyRateCell.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

protocol ConverterCurrencyRateCellDelegate: class {
    func onCellTextFieldDidBeginEdit(_ cell: ConverterCurrencyRateCell)
    func onCellTextFieldDidEndEdit(_ cell: ConverterCurrencyRateCell)
    func onCellTextFieldValueDidChange(_ cell: ConverterCurrencyRateCell)
}

class ConverterCurrencyRateCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    weak var delegate: ConverterCurrencyRateCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.amountTextField.addTarget(self, action: #selector(onTextFieldDidBeginEdit), for: .editingDidBegin)
        self.amountTextField.addTarget(self, action: #selector(onTextFieldDidEndEdit), for: .editingDidEnd)
        self.amountTextField.addTarget(self, action: #selector(onTextFieldValueDidChange), for: .editingChanged)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flagImageView.image = nil
        currencyLabel.text = ""
        descriptionLabel.text = ""
        amountTextField.text = ""
    }
    
    func configure(currencyRateViewModel: CurrencyRateViewModel) {
        currencyLabel.text = currencyRateViewModel.currency
        descriptionLabel.text = currencyRateViewModel.currencyDescription
        amountTextField.text = String(format: "%.2f", currencyRateViewModel.amount ?? 0.0)
    }
    
    func activateInput() {
        amountTextField.becomeFirstResponder()
    }
    
    @objc func onTextFieldDidBeginEdit() {
        delegate?.onCellTextFieldDidBeginEdit(self)
    }
    
    @objc func onTextFieldDidEndEdit() {
        delegate?.onCellTextFieldDidEndEdit(self)
    }

    @objc func onTextFieldValueDidChange() {
        delegate?.onCellTextFieldValueDidChange(self)
    }
}
