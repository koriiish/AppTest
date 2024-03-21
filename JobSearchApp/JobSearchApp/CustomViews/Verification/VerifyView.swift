//
//  VerifyView.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 21.03.24.
//

import UIKit

protocol VerifyProtocol: AnyObject {
    func verify()
}

class VerifyView: UIView {
    
    weak var verifyDelegate: VerifyProtocol?
    
    var fieldStack = UIStackView()
    var verifyFields = [VerifyTextField]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        verifyTextFieldConfiguration()
        setConstraints()
        verifyFields[0].becomeFirstResponder()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)

    }
    
    private func verifyTextFieldConfiguration() {
        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        fieldStack.spacing = 5
        fieldStack.distribution = .fillEqually
        
        for number in 0...3 {
            let verifyTextField = VerifyTextField()
            verifyTextField.tag = number
            verifyTextField.fieldDelegate = self
            verifyFields.append(verifyTextField)
            fieldStack.addArrangedSubview(verifyTextField)
        }
        addSubview(fieldStack)
    }
    
    func getFieldsCode() -> String {
        var fieldsCode = ""
        verifyFields.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
    }
}

//MARK: - FieldsProtocol

extension VerifyView: FieldsProtocol {
    func activateNextField(tag: Int) {
        if tag != verifyFields.count - 1 {
            verifyFields[tag + 1].becomeFirstResponder()
        }
            //else {
//            verifyDelegate?.verify()
//        }
    }
    
    func activatePreviosField(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].text = ""
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
    
    
}

//MARK: - Set Constraints

extension VerifyView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
