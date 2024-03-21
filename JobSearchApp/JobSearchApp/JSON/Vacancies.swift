//
//  Vacancies.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 22.03.24.
//

import Foundation
struct Vacancies: Codable {
    
    let lookingNumber: Int
    let title: String
    let salary: Int 
    let town: String
    let company: String 
    let previewText: String
    let publishedDate: String
    let isFavorite: Bool
}




//      "lookingNumber": 2,
//      "title": "UI/UX дизайнер",
//      "address": {
//        "town": "Минск",
//        "street": "улица Бирюзова",
//        "house": "4/5"
//      },
//      "company": "Мобирикс",
//      "experience": {
//        "previewText": "Опыт от 1 до 3 лет",
//        "text": "1–3 года"
//      },
//      "publishedDate": "2024-02-20",
//      "isFavorite": false,
//      "salary": {
//        "full": "Уровень дохода не указан"
//      },
//      "schedules": [
//        "полная занятость",
//        "полный день"
//      ],
//      "appliedNumber": 147,
//      "description": "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
//      "responsibilities": "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
//      "questions": [
//        "Где располагается место работы?",
//        "Какой график работы?",
//        "Вакансия открыта?",
//        "Какая оплата труда?"
