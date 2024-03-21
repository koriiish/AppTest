//
//  CustomEmployeeSearchView.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

class CustomEmployeeSearchView: UIView {

    let employeeSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск сотрудников"
        label.font = UIFont(name: "Optima", size: 18)
        label.textColor = UIColor(named: "customWhite")
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Размещение вакансий и доступ к базе резюме"
        label.font = UIFont(name: "Optima", size: 14)
        label.textColor = UIColor(named: "customWhite")
        return label
    }()
    
    let findEmployeeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "greenButton")
        button.setTitle("Я ищу сотрудников", for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        employeeSearchLabel.frame = CGRect(x: 10, y: 20, width: 250, height: 20)
        infoLabel.frame = CGRect(x: 10, y: 40, width: 350, height: 30)
        findEmployeeButton.frame = CGRect(x: 10, y: 85, width: 370, height: 30)
 
       
        addSubview(employeeSearchLabel)
        addSubview(infoLabel)
        addSubview(findEmployeeButton)
    }

}
