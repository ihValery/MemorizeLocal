//
//  GameBoardScorePanelView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

struct GameBoardScorePanelView: View {  
    @ObservedObject var viewModelGame: GameBoardViewModel
    
    var body: some View {
        HStack(alignment: .center) { 
            Text(viewModelGame.cards.allSatisfy({ $0.isMatched == true}) ? "Твой результат:" : "Счет:")
                .font(.title)
                .fontWeight(.medium)
            
            Text(viewModelGame.updateScore())
                .font(.title)
                .fontWeight(.medium)
                .frame(minWidth: 50, alignment: .center)
            
//            //TEST
//            Button {
//                viewModelGame.endGame()
//            } label: {
//                Text("endGame")
//            }
        }
        
        .contextMenu(ContextMenu(menuItems: {
            Button("Новая игра", action: {
                withAnimation(.easeIn(duration: 0.5)) {
                    viewModelGame.newGame()
                }
            })
        }))
        .font(.title2)
    }
}

struct GameBoardScorePanelView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardScorePanelView(viewModelGame: GameBoardViewModel())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
