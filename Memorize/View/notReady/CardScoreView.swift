//
//  CardScoreView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct CardScoreView: View {
    
    //MARK: - Properties

    var scoreViewModel: ScoreViewModel
    
    @State private var viewState = CGSize.zero
    @State private var showAlert = false

    //MARK: - Body

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .offset(x: 40)
                    .offset(x: viewState.width)
            }
            
            ZStack {
                HStack {
                    Text(scoreViewModel.score.theme)
                        .font(.system(size: isWithBangs ? 60 : 50))
                    
                    VStack(alignment: .leading) {
                        Text("Результат ")
                            .font(isWithBangs ? .title : .title2)
                        Text(scoreViewModel.dateToString())
                            .font(isWithBangs ? .subheadline : .footnote).opacity(0.6)
                    }
                    .opacity(0.6)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text(String(scoreViewModel.score.maxScore))
                        .font(.system(size: isWithBangs ? 50 : 40).bold())
                        .opacity(0.7)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
            .background(BackgroundCardScoreView())
            .padding(.vertical, 35).padding(.leading, 10)
            .offset(x: viewState.width)
            
            .gesture(
                DragGesture()
                
                    .onChanged { value in
                        if value.translation.width < 0 {
                            viewState = value.translation
                        } else {
                            viewState = .zero
                        }
                    }
                
                    .onEnded { value in
                        if value.location.x < value.startLocation.x - 50 {
                            showAlert.toggle()
                        }
                        viewState = .zero
                    }
            )
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Удалить счет"), message: Text("Это действие нельзя будет отменить"),
                      primaryButton: .destructive(Text("Удалить")) { scoreViewModel.remove() },
                      secondaryButton: .cancel(Text("Нет"))
                )
            }
        }
    }
    
}

//struct CardScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        let indexFoodCard = 5
//
//        if indexFoodCard < testData.count {
//            let score = testData[indexFoodCard]
//            CardScoreView(scoreViewModel: ScoreViewModel(score: score))
//        } else {
//            CardScoreView(scoreViewModel: ScoreViewModel(score: <#T##Score#>))
//        }
//    }
//}
