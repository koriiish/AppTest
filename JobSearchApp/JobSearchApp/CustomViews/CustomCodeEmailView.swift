//
//  CustomCodeEmailView.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 19.03.24.
//

import UIKit

class CustomCodeEmailView: UIView {

    let codeLabel: UILabel = {
        let label = UILabel()
        label.text = "Отправили код на example@mail.ru"
        label.font = UIFont(name: "Optima", size: 20)
        label.textColor = UIColor(named: "customWhite")
        return label
    }()
    
    let extraInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
        label.font = UIFont(name: "Optima", size: 14)
        label.numberOfLines = 3
        label.textColor = UIColor(named: "customWhite")
        return label
    }()
    
    let verifyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "darkBlueButton")
        button.setTitle("Подтвердить", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let verifyView = VerifyView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLabels()
        setVerifyConstraints()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        
    }
    
    //    @objc func verifyButtonTapped() {
    //        let fieldsCode = verifyView.getFieldsCode()
    //        if fieldsCode == accessCode {
    //            let searchController = SearchController()
    //            searchController.modalPresentationStyle = .fullScreen
    //
    //        }
    
    
    func setupUI() {
        backgroundColor = UIColor(named: "backgroundPrimary")
    }
    
    
    func setupLabels() {
        codeLabel.frame = CGRect(x: 10, y: 20, width: 350, height: 20)
        extraInfoLabel.frame = CGRect(x: 10, y: 40, width: 350, height: 60)
        verifyButton.frame = CGRect(x: 10, y: 195, width: 370, height: 50)
        
        
        addSubview(codeLabel)
        addSubview(extraInfoLabel)
        addSubview(verifyButton)
        addSubview(verifyView)
    }
    
    func setVerifyConstraints() {
        NSLayoutConstraint.activate([
            verifyView.topAnchor.constraint(equalTo: extraInfoLabel.bottomAnchor, constant: 10),
            verifyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            verifyView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            verifyView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
