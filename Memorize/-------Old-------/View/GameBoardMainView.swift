//
//  GameBoardMainView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI

struct GameBoardMainView: View {
    @ObservedObject var viewModelGame: GameBoardViewModel
    @ObservedObject var theme = ThemeViewModel.shared
    @ObservedObject var scoreListViewModel: ResultsTableViewModel
    
    var body: some View {
        ZStack {
           AnimationForAppearView()
            
            VStack {
                GameBoardScorePanelView(viewModelGame: viewModelGame)
                    .padding(.bottom, -4) 
                
                if viewModelGame.cards.allSatisfy { $0.isMatched == true } {
                    VictoryView(viewModelGame: viewModelGame, theme: theme)
                        .onAppear {
                            scoreListViewModel.add(theme: themeData[theme.current].avatar, number: viewModelGame.updateScore())
                        }
                    
                } else {
                    Grid(viewModelGame.cards) { item in
                        GameBoardCardView(card: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.5)) {
                                    viewModelGame.choose(item)
                                }
                            }
                            .padding(4)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .padding(.horizontal, 3)
            .padding(.bottom, 20)
            .foregroundColor(themeData[theme.current].color)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct GameBoardMainView_Previews: PreviewProvider {
    static var previews: some View {
        let oneCard = GameBoardViewModel()
        return GameBoardMainView(viewModelGame: oneCard, scoreListViewModel: ResultsTableViewModel())
        //            .preferredColorScheme(.dark)
    }
}
