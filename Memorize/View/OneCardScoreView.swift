//
//  OneCardScoreView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

//MARK: - OneCardScoreView

struct OneCardScoreView: View {
    
    //MARK: Properties

    @State private var gestureState = CGSize.zero
    
    @State private var showAlert = false
    
    private var scoreViewModel: ScoreViewModel
    
    //MARK: Body

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .offset(x: 40)
                    .offset(x: gestureState.width)
            }
            
            ZStack {
                HStack {
                    Text(scoreViewModel.scoreSheet.theme)
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
                    Text(String(scoreViewModel.scoreSheet.maxScore))
                        .font(.system(size: isWithBangs ? 50 : 40).bold())
                        .opacity(0.7)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
            .background(BackgroundCardScoreView())
            .padding(.vertical, 35).padding(.leading, 10)
            .offset(x: gestureState.width)
            
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            gestureState = gesture.translation
                        } else {
                            gestureState = .zero
                        }
                    }
                
                    .onEnded { value in
                        if value.location.x < value.startLocation.x - 50 {
                            showAlert.toggle()
                        }
                        gestureState = .zero
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
    
    //MARK: Initializer
    
    init(scoreViewModel: ScoreViewModel) {
        self.scoreViewModel = scoreViewModel
    }
}

//MARK: - PreviewProvider

struct CardScoreView_Previews: PreviewProvider {
    static var previews: some View {
        OneCardScoreView(scoreViewModel: ScoreViewModel())
    }
}
