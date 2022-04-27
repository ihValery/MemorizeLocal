//
//  IconForTheme.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 27.09.2021.
//

import SwiftUI

enum IconForTheme {
    case age(trim: CGFloat)
    case timer(trim: CGFloat)
    case level(trim: CGFloat)
    
    //MARK: - Properties
    
    var rawValue: String {
        switch self {
        case .age:
            return "age"
        case .timer(_):
            return "timer"
        case .level(_):
            return "level"
        }
    }
    
    var forTrim: CGFloat {
        switch self {
        case .age(let trim):
            return trim
        case .timer(let trim):
            return trim
        case .level(let trim):
            return trim
        }
    }
    
}
