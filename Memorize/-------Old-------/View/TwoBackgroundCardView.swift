//
//  TwoBackgroundCardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct TwoBackgroundCardView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Color.defaultElement
            .opacity(0.6)
            .cornerRadius(showMenu ? 15 : 0)
            .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
            .offset(x: showMenu ? (isWithBangs ? -25 : -20) : 0)
            .padding(.vertical, 30)
            .blur(radius: 1)
        
        Color.defaultElement
            .opacity(0.4)
            .cornerRadius(showMenu ? 15 : 0)
            .offset(x: showMenu ? (isWithBangs ? -50 : -35) : 0)
            .padding(.vertical, 60)
            .blur(radius: 2)
    }
}
