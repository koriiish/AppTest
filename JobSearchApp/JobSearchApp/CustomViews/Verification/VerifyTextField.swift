//
//  VerifyTextField.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 21.03.24.
//

import UIKit

protocol FieldsProtocol: AnyObject {
    func activateNextField(tag: Int)
    func activatePreviosField(tag: Int)
}

class VerifyTextField: UITextField {
    
    weak var fieldDelegate: FieldsProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)

    }
    
    private func configure() {
        backgroundColor = .customGrey1
        layer.cornerRadius = 10
        tintColor = .customGrey4
        layer.borderColor = UIColor.customGrey4.cgColor
        textColor = .customGrey4
        font = UIFont.boldSystemFont(ofSize: 30)
        textAlignment = .center
        placeholder = "*"
        keyboardType = .numberPad
        let color = UIColor(named: "customGrey4")
        let placeholder = placeholder ?? ""
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color!])
    }
    
    override func deleteBackward() {
        fieldDelegate?.activatePreviosField(tag: tag)
    }
}
//MARK: - UITextFieldDelegate

extension VerifyTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        text = string
        
        if range.length == 0 {
            fieldDelegate?.activateNextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
