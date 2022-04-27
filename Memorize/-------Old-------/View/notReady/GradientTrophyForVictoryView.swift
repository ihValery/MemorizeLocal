//
//  GradientTrophyForVictoryView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 23.05.21.
//

import SwiftUI

struct GradientTrophyForVictoryView: View {
    
    //MARK: - Properties

    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject private var theme = ThemeViewModel.shared
    
    //MARK: - Body

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.sideMenuStart, themeData[theme.current].color]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .mask(
                Text("🏆")
                    .font(.system(size: 250))
            )
    }
    
}

struct GradientTrophyForVictoryView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTrophyForVictoryView()
    }
}
