//
//  CustomJobSearchView.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

class CustomJobSearchView: UIView, UITextFieldDelegate {
    
    let jobSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск работы"
        label.font = UIFont(name: "Optima", size: 18)
        label.textColor = .white
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Электронная почта или телефон"
        textField.backgroundColor = UIColor(named: "customGrey1")
        textField.layer.cornerRadius = 10
        textField.keyboardType = .emailAddress
        textField.layer.borderColor = UIColor(named: "backgroundPrimary")?.cgColor
        let color = UIColor(named: "customGrey4")
        let placeholder = textField.placeholder ?? ""
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color!])
        return textField
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let loginWithPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти с паролем", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField.delegate = self
        setupUI()
        setupLabels()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
     
    }
    
    func setupUI() {
        backgroundColor = UIColor(named: "Shadows")
        layer.cornerRadius = 15
    }
    
    func setupLabels() {
        jobSearchLabel.frame = CGRect(x: 10, y: 20, width: 150, height: 20)
        emailTextField.frame = CGRect(x: 10, y: 60, width: 350, height: 40)
        continueButton.frame = CGRect(x: 10, y: 120, width: 180, height: 40)
        loginWithPasswordButton.frame = CGRect(x: 210, y: 120, width: 150, height: 40)
        
        
        addSubview(jobSearchLabel)
        addSubview(emailTextField)
        addSubview(continueButton)
        addSubview(loginWithPasswordButton)
        
//        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
//    @objc func continueButtonTapped() {
//        if isValidEmail(email: emailTextField.text ?? "") == true {
//            let customCodeEmailView = CustomCodeEmailView(frame: CGRect(x: 0, y: 0, width: 390, height: 1000))
//            addSubview(customCodeEmailView)
//
//        }
//    }
//
//    func isValidEmail(email: String) -> Bool {
//            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
//            return emailPredicate.evaluate(with: email)
//        }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        emailTextField.resignFirstResponder()
//            return true
//        }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//            if let email = emailTextField.text, !isValidEmail(email: email) {
//                shakeTextField()
//                emailTextField.layer.borderColor = UIColor.red.cgColor
//                emailTextField.layer.borderWidth = 1.0
//            }
//        }
//    func shakeTextField() {
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.duration = 0.07
//            animation.repeatCount = 4
//            animation.autoreverses = true
//
//            let fromPoint = CGPoint(x: emailTextField.center.x - 10, y: emailTextField.center.y)
//            let toPoint = CGPoint(x: emailTextField.center.x + 10, y: emailTextField.center.y)
//
//            animation.fromValue = NSValue(cgPoint: fromPoint)
//            animation.toValue = NSValue(cgPoint: toPoint)
//
//        emailTextField.layer.add(animation, forKey: "position")
//        }
}

