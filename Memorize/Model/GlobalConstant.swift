//
//  GlobalConstant.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: GlobalConstant

struct GlobalConstant {
    static let cornerRadius: CGFloat = 25
    
    struct Opacity {
        static let substrate: CGFloat = 0.01
        static let weak: CGFloat      = 0.1
        static let meddle: CGFloat    = 0.4
        static let strong: CGFloat    = 0.7
    }
    
    struct SideMenu {
        static let game: String         = "Новая игра"
        static let score: String        = "Счет"
        static let notification: String = "Уведомление"
        static let theme: String        = "Темы"
        static let rule: String         = "Правила"
        
        static let sing: String         = "Тема"
        static let version: String      = "Theme"
    }
    
    struct Theme { //fixme
        static let key: String   = "Theme"
        static let title: String = "Тема"
    }
}
