//
//  GameBoardCardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

// Структура для одной карты
struct GameBoardCardView: View {
    var card: GameBoard<String>.Card
    @ObservedObject var theme = ThemeViewModel.shared
    
    //будем анимировать, но перед запуском анимации убедимcя, что синхронизированы с Model
    @State private var animatedBonusRemaning: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            bodyForCard(for: geometry.size)
        }
    }
    
    @ViewBuilder private func bodyForCard(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                substrateForAnimation()
                
                Text(card.content)
                    .font(.sizeEmoji(for: size))
                    .scaleEffect(card.isMatched ? 1.1 : 1)
                    .animation(card.isMatched ? .linear.repeatForever() : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaning = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaning = 0
        }
    }
    
    @ViewBuilder private func substrateForAnimation() -> some View {
        if themeData[theme.current].timer == 0 {
            Star()
                .padding(5)
                .opacity(0.25)
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? .linear(duration: 0.1).repeatForever(autoreverses: false) : .default)
        } else {
            Group {
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle.degrees(0 - 90),
                        endAngle: Angle.degrees(-animatedBonusRemaning * 360 - 90),
                        clockwise: true)
                        .onAppear() {
                            startBonusTimeAnimation()
                        }
                } else {
                    Pie(startAngle: Angle.degrees(0 - 90),
                        endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90),
                        clockwise: true)
                }
            }
            .padding(5)
            .opacity(0.25)
            //анимационный пирог пусть появляется сразу
            .transition(.identity)
        }
    }
}

struct GameBoardCardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = GameBoardViewModel().cards.first!
        GameBoardCardView(card: card)
    }
}
