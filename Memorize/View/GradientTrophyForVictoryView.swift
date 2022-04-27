//
//  GradientTrophyForVictoryView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 23.05.21.
//

import SwiftUI

struct GradientTrophyForVictoryView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var theme = ThemeViewModel.shared
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.sideMenuStart, themeData[self.theme.current].color]),
                                 startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .mask(MaskImageView())
    }
}

struct MaskImageView: View {
    var body: some View {
        Text("🏆")
            .font(.system(size: 250))
    }
}

struct GradientTrophyForVictoryView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTrophyForVictoryView()
    }
}
