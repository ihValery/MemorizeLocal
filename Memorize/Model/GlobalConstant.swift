//
//  GlobalConstant.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: - GlobalConstant

struct GlobalConstant {
    static let cornerRadius: CGFloat = 25
    
    struct CornerRadius {
        ///60
        static let cardScoreBig: CGFloat = 60
        ///6
        static let cardScoreSmall: CGFloat = 6
    }
    
    struct Opacity {
        ///substrate = 0.01
        static let substrate: CGFloat = 0.01
        ///weak = 0.1
        static let weak: CGFloat = 0.1
        ///meddle = 0.4
        static let meddle: CGFloat = 0.4
        ///strong = 0.7
        static let strong: CGFloat = 0.7
    }
    
    struct NameString {
        static let cardScoreAlertDeleteTitle: String = "Удалить счет?"
        static let cardScoreAlertDeleteMessage: String = "Это действие нельзя будет отменить."
        static let cardScoreResult: String = "Результат"
    }
    
    struct NameButton {
        static let ok: String = "Ok"
        static let delete: String = "Удалить"
        static let no: String = "Нет"
    }
    
    struct SystemImage {
        static let trash: String = "trash"
    }
    
    ///Step multiple of 4
    struct Padding {
        static let step12: CGFloat = 12
        static let step20: CGFloat = 20
        static let step32: CGFloat = 32
    }
    
    
    
    struct SideMenu {
        static let game: String = "Новая игра"
        static let score: String = "Счет"
        static let notification: String = "Уведомление"
        static let theme: String = "Темы"
        static let rule: String = "Правила"
        static let sing: String = "Тема"
        static let version: String = "Theme"
    }
    
    struct Theme { //fixme
        static let key: String = "Theme"
        static let title: String = "Тема"
    }
}
