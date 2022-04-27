//
//  ViewExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

extension View {
    var isWithBangs: Bool {
        UIScreen.main.bounds.height > 750
    }
    
    func getScreeSize() -> CGRect {
        UIScreen.main.bounds
    }
}
