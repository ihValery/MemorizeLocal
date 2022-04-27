//
//  GameBoardViewModel.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.04.21.
//

import SwiftUI

final class GameBoardViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published private var modelGame: GameBoard<String> = GameBoardViewModel.createMemoryGame()
    
    var cards: Array<GameBoard<String>.Card> {
        modelGame.cards
    }
    
    //MARK: - Public Methods
    
    func choose(_ card: GameBoard<String>.Card) {
        modelGame.choose(card)
    }
    
    func newGame() {
        let collectionShuffled = themeData[ThemeViewModel.shared.current].collection.shuffled()
        
        modelGame = GameBoardViewModel.createMemoryGame(collectionShuffled)
    }
    
    func updateScore() -> String {
        String(modelGame.score)
    }
    
    //MARK: - Private Methods
    
    static private func createMemoryGame(_ collectionShuffled: [String]? = nil) -> GameBoard<String> {
        
        return GameBoard<String>(numbersOfPairsOfCards: themeData[ThemeViewModel.shared.current].number) { pairIndex in
            if let collectionShuffled = collectionShuffled {
                return collectionShuffled[pairIndex]
            } else {
                return themeData[ThemeViewModel.shared.current].collection[pairIndex]
            }
        }
    }
    
}
