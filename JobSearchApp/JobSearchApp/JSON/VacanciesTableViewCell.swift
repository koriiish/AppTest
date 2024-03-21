//
//  VacanciesTableViewCell.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 22.03.24.
//

import UIKit

class VacanciesTableViewCell: UITableViewCell {
    
    lazy var lookingNumberLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var salaryShortLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var townLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var companyLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var previewTextLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var publishedDateLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var respondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var isFavoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupLabels() {
        addSubview(lookingNumberLabel)
        addSubview(titleLabel)
        addSubview(salaryShortLabel)
        addSubview(townLabel)
        addSubview(companyLabel)
        addSubview(previewTextLabel)
        addSubview(publishedDateLabel)
        addSubview(respondButton)
        addSubview(isFavoriteButton)
        
        NSLayoutConstraint.activate([
            lookingNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            lookingNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lookingNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: lookingNumberLabel.bottomAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            salaryShortLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            salaryShortLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            salaryShortLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            townLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            townLabel.topAnchor.constraint(equalTo: salaryShortLabel.bottomAnchor, constant: 10),
            townLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            companyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            companyLabel.topAnchor.constraint(equalTo: townLabel.bottomAnchor, constant: 10),
            companyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            previewTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            previewTextLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 10),
            previewTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            publishedDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            publishedDateLabel.topAnchor.constraint(equalTo: previewTextLabel.bottomAnchor, constant: 10),
            publishedDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            respondButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            respondButton.topAnchor.constraint(equalTo: publishedDateLabel.bottomAnchor, constant: 10),
            respondButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
//            isFavoriteButton.leadingAnchor.constraint(equalTo: lookingNumberLabel.trailingAnchor, constant: 10),
            isFavoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            isFavoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    func configure(vacancies: Vacancies) {
        lookingNumberLabel.text = "Сейчас просматривает \(vacancies.lookingNumber) человек"
        titleLabel.text = "\(vacancies.title)"
        salaryShortLabel.text = "\(vacancies.salary) Br"
        townLabel.text = "\(vacancies.town)"
        companyLabel.text = "\(vacancies.company)"
        previewTextLabel.text = "Adress: \(vacancies.previewText)"
        publishedDateLabel.text = "\(vacancies.publishedDate)"
        
        respondButton.setTitle("Откликнуться", for: .normal)
//        isFavoriteButton.
        
    }
}
