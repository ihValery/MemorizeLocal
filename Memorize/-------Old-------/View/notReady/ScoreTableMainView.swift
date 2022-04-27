//
//  ScoreTableMainView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct ScoreTableMainView: View {
    
    //MARK: Properties
 
//    @ObservedObject var session: SessionFirebase
    
    @State private var onAnimation = false
    
    @ObservedObject private var theme = ThemeViewModel.shared
    @ObservedObject private var scoreListViewModel = ResultsTableViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                GeometryReader { gr in
                    ScrollView {
//                        ForEach(scoreListViewModel.scoreViewModels, id: \.self) { item in
//                            CardScoreView(scoreViewModel: item)
//                                .offset(y: onAnimation ? 0 : getScreeSize().height)
//                        }
//                        .offset(y: 25)
                    }
                    .frame(height: gr.size.height - 165)
                }
                .offset(y: 170)
            }
            
            ZStack {
                ScoreBackgroundWithBubbleView()
                
                VStack {
                    HeaderScoreView(isAnimation: $onAnimation)
                        .frame(height: getScreeSize().height / 6)
                        .padding(.top, 70)
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        
        .onAppear {
            onAnimation.toggle()
        }
    
        .onDisappear {
            onAnimation.toggle()
        }
    }
    
}

struct ScoreTableMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreTableMainView()
    }
}
