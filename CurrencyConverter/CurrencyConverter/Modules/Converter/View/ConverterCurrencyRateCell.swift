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

class ConverterCurrencyRateCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountActiveView: UIView!
    
    weak var delegate: ConverterCurrencyRateCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.amountTextField.addTarget(self, action: #selector(onTextFieldValueDidChange), for: .editingChanged)
        self.amountTextField.delegate = self
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        flagImageView.image = nil
        currencyLabel.text = ""
        descriptionLabel.text = ""
        amountTextField.text = ""
        amountActiveView.backgroundColor = UIColor.lightGray
    }
    
    func configure(currencyRateViewModel: CurrencyRateViewModel) {
        flagImageView.image = CurrencyCountryMapper.flag(currencyCode: currencyRateViewModel.currencyCode)
        currencyLabel.text = currencyRateViewModel.currencyCode
        descriptionLabel.text = currencyRateViewModel.currencyName
        amountTextField.text = String(format: "%.2f", currencyRateViewModel.amount ?? 0.0)
    }
    
    func activateInput() {
        amountTextField.becomeFirstResponder()
    }

    @objc func onTextFieldValueDidChange() {
        delegate?.onCellTextFieldValueDidChange(self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            return true // allow to delete all text in field
        }
        return newText.isValidNumberWithTwoDecimalPlaces()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        amountActiveView.backgroundColor = UIColor.skyBlue()
        delegate?.onCellTextFieldDidBeginEdit(self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        amountActiveView.backgroundColor = UIColor.lightGray
        delegate?.onCellTextFieldDidEndEdit(self)
    }
}
