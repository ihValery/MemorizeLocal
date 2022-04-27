//
//  VictoryView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 22.05.21.
//

import SwiftUI

struct VictoryView: View {
    
    //MARK: - Properties

    @ObservedObject var viewModelGame: GameBoardViewModel
    
    @ObservedObject private var theme = ThemeViewModel.shared
    
    //MARK: - Body

    var body: some View {
        VStack {
            GradientTrophyForVictoryView()
            
            Button(action: {
                withAnimation {
                    viewModelGame.newGame()                    
                }
            }) {
                Text("Новая игра")
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .contentShape(Rectangle())
            }
            .padding(13)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(themeData[self.theme.current].color.opacity(0.9), lineWidth: 3))
            .padding()
        }
        .font(.title.weight(.light))
        .foregroundColor(themeData[self.theme.current].color)
        .padding()
        .transition(.animationForAlarm)
    }
    
}

struct ButtonNewGameVictory_Previews: PreviewProvider {
    static var previews: some View {
        VictoryView(viewModelGame: GameBoardViewModel())
    }
}
