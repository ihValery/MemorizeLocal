//
//  Theme.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct Theme: Identifiable {
    
    //MARK: Properties

    var id: Int
    var name: String
    var avatar: String
    
    var level: Int
    var levelFloat: CGFloat {
        CGFloat(level) / 10.0
    }
    
    var timer: CGFloat
    
    var age: Int
    var ageFloat: CGFloat {
        CGFloat(age) / 18.0
    }
    var color: Color
    
    var number: Int
    var collection: [String]
    
    enum Name {
        static let cartoon    = "Мультяшки"
        static let muzzle     = "Мордочки"
        static let zoo        = "Зоопарк"
        static let halloween  = "Хэллоуин"
        static let profession = "Профессии"
        static let food       = "Еда"
        static let smile      = "Смайлики"
        static let sport      = "Спорт"
        static let random     = "Рандом"
        static let flag       = "Флаги"
        static let symbol     = "Символы"
    }
}
