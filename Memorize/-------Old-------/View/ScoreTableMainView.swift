//
//  ScoreTableMainView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableMainView: View {
    @ObservedObject var theme = ThemeViewModel.shared
    @ObservedObject var session: SessionFirebase
    @ObservedObject var scoreListViewModel = ResultsTableViewModel()
    
    @Binding var onAnimation: Bool
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { gr in
                    ScrollView {
                       ForEach(scoreListViewModel.scoreViewModels) { item in
                            CardScoreView(scoreViewModel: item)
                                .offset(y: onAnimation ? 0 : getRect().height)
                        }
                        .offset(y: 25)
                    }
                    .frame(height: gr.size.height - 165)
                }
                .offset(y: 170)
            }
            
            ZStack {
                ScoreBackgroundWithBubbleView()
                
                VStack {
                    HeaderScoreView(session: session, isAnimation: $onAnimation)
                        .frame(height: getRect().height / 6)
                        .padding(.top, 70)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ScoreTableMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableMainView(session: SessionFirebase(), onAnimation: .constant(true))
    }
}
