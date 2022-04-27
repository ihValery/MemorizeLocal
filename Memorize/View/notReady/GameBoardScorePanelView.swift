//
//  GameBoardScorePanelView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 7.05.21.
//

import SwiftUI

struct GameBoardScorePanelView: View {
    
    //MARK: - Properties

    @ObservedObject var viewModelGame: GameBoardViewModel
    
    //MARK: - Body

    var body: some View {
        HStack(alignment: .center) {
            Text(viewModelGame
                    .cards
                    .allSatisfy { $0.isMatched == true } ? "Твой результат:" : "Счет:")
                .font(.title)
                .fontWeight(.medium)
            
            Text(viewModelGame.updateScore())
                .font(.title)
                .fontWeight(.medium)
                .frame(minWidth: 50, alignment: .center)
        }
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
