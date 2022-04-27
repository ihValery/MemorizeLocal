//
//  IconForThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

struct IconForThemeView: View {
    var icon: IconForTheme
    var theme: Theme
    var activeTheme: Bool
    
    init(_ icon: IconForTheme, _ theme: Theme, _ activeTheme: Bool) {
        self.icon = icon
        self.theme = theme
        self.activeTheme = activeTheme
    }
    
    var body: some View {
        Image(icon.rawValue)
            .resizable()
            .frame(width: isWithBangs ? 28 : 20, height: isWithBangs ? 28 : 20)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 5)
                    Circle()
                        .trim(from: 0, to: icon.forTrim)
                        .stroke(Color.white, lineWidth: 5)
                }
                .rotationEffect(
                    .degrees(activeTheme ? 270 : -90))
            )
            .clipShape(Circle())
    }
}
