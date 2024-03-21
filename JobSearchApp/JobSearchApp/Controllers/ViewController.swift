//
//  ViewController.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

class ViewController: UIViewController {
    
    let customJobSearchView = CustomJobSearchView(frame: CGRect(x: 2, y: 200, width: 390, height: 200))
    let customEmployeeSearchView = CustomEmployeeSearchView(frame: CGRect(x: 2, y: 420, width: 390, height: 150))
    let customCodeEmailView = CustomCodeEmailView(frame: CGRect(x: 2, y: 200, width: 390, height: 1000))
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход в личный кабинет"
        label.font = UIFont(name: "Optima", size: 20)
        label.frame = CGRect(x: 10, y: 60, width: 300, height: 40)
        label.textColor = .white
        return label
    }()
    
    private let accessCode = "1234"
//    private let verifyView = VerifyView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupEnterLabel()
        tabBarIsActivated(true)
        
        view.addSubview(customJobSearchView)
        view.addSubview(customEmployeeSearchView)
        
        customCodeEmailView.verifyView.verifyDelegate = self
        
        customJobSearchView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        customCodeEmailView.verifyButton.addTarget(self, action: #selector(verifyButtonTapped), for: .touchUpInside)
    }
    
    @objc func continueButtonTapped() {
        if isValidEmail(email: customJobSearchView.emailTextField.text ?? "") == true {
//            let customCodeEmailView = CustomCodeEmailView(frame: CGRect(x: 2, y: 200, width: 390, height: 1000))
            view.addSubview(customCodeEmailView)
            customEmployeeSearchView.removeFromSuperview()
            enterLabel.removeFromSuperview()
        }
    }
    @objc func verifyButtonTapped() {
        let fieldsCode = customCodeEmailView.verifyView.getFieldsCode()
        if fieldsCode == accessCode {
            let searchController = SearchController()
            searchController.modalPresentationStyle = .fullScreen
            present(searchController, animated: true)
            
           // tabBarIsActivated(true)
        }
    }
    
    func isValidEmail(email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customJobSearchView.emailTextField.resignFirstResponder()
            return true
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if let email = customJobSearchView.emailTextField.text, !isValidEmail(email: email) {
            shakeTextField()
            customJobSearchView.emailTextField.layer.borderColor = UIColor.red.cgColor
            customJobSearchView.emailTextField.layer.borderWidth = 1.0
            }
        }
    func shakeTextField() {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true

        let fromPoint = CGPoint(x: customJobSearchView.emailTextField.center.x - 10, y: customJobSearchView.emailTextField.center.y)
        let toPoint = CGPoint(x: customJobSearchView.emailTextField.center.x + 10, y: customJobSearchView.emailTextField.center.y)

            animation.fromValue = NSValue(cgPoint: fromPoint)
            animation.toValue = NSValue(cgPoint: toPoint)

        customJobSearchView.emailTextField.layer.add(animation, forKey: "position")
        }
    
    func setupEnterLabel() {
        view.addSubview(enterLabel)
    }
    
//    func tabBarIsActivated(_ bool: Bool) {
//        var allButtonsPressed = false {
//            didSet {
//                if let items = tabBarController?.tabBar.items {
//                    items[0].isEnabled = allButtonsPressed
//                    items[1].isEnabled = allButtonsPressed
//                    items[2].isEnabled = allButtonsPressed
//                    items[3].isEnabled = allButtonsPressed
//                    items[4].isEnabled = allButtonsPressed
//                }
//            }
//        }
//        allButtonsPressed = bool
//    }
    
}
//MARK: - VerifyProtocol,TabBarActivated

extension ViewController: VerifyProtocol, TabBarActivated {
    func tabBarIsActivated(_ bool: Bool) {
        var allButtonsPressed = bool {
            didSet {
                if let items = tabBarController?.tabBar.items {
                    items[0].isEnabled = allButtonsPressed
                    items[1].isEnabled = allButtonsPressed
                    items[2].isEnabled = allButtonsPressed
                    items[3].isEnabled = allButtonsPressed
                    items[4].isEnabled = allButtonsPressed
                }
            }
        }
       // allButtonsPressed = bool
    }
    func verify() {
        verifyButtonTapped()
    }
}
