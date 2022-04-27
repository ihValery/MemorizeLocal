//
//  AnyTransitionExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.05.21.
//

import SwiftUI

extension AnyTransition {
    ///Перезапись появления и исчезновения анимации
    static var animationForAlarm: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: opacity)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: opacity)
            .combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
