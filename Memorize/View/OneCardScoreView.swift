//
//  OneCardScoreView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

//MARK: - OneCardScoreView

struct OneCardScoreView: View {

    //MARK: InternalConstant
    
    struct InternalConstant {
        static let heightCard: CGFloat = 120
    }
    
    //MARK: Properties
    
    //исправить на подобии selectTheme
    @ObservedObject private var theme = ThemeViewModel.shared

    @State private var gestureState: CGSize = .zero
    
    @State private var isShowAlert: Bool = false

    private var widthDeleteButton: CGFloat {
        gestureState.width * -1
    }
    
    private let nameTheme: String
    
    private let date: String
    
    private let maxScore: String
    
    //MARK: Body

    var body: some View {
        GeometryReader { geometry in
            deleteButton(geometry)

            headerCard(geometry)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        gestureOnChange(value)
                    }
                    .onEnded { value in
                        gestureOnEnded(value, geometry)
                    }
            )
        }
        .frame(height: InternalConstant.heightCard)
        .cornerRadius(GlobalConstant.CornerRadius.cardScoreSmall)
        .clipShape(CustomCorners(corner: [.topLeft, .bottomRight],
                                 radius: GlobalConstant.CornerRadius.cardScoreBig))
    }
    
    //MARK: Initializer

    init(_ nameTheme: String, date: String, maxScore: Int) {
        self.nameTheme = nameTheme
        self.date = date
        self.maxScore = String(maxScore)
    }
    
    //MARK: Private Method
    
    private func deleteButton(_ geometry: GeometryProxy) -> some View {
        Image(systemName: GlobalConstant.SystemImage.trash)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.trailing, GlobalConstant.Padding.step12)
            .offset(x: fastOnsetAndSlowOffset())
            .frame(width: widthDeleteButton,
                   height: geometry.size.height, alignment: .trailing)
            .background(Color.red)
            .frame(width: geometry.size.width, alignment: .trailing)
            .animation(.spring(), value: widthDeleteButton)
    }
    
    private func headerCard(_ geometry: GeometryProxy) -> some View {
        HStack {
            Text(nameTheme)
                .font(sizeFont(geometry, multiplier: 1.7))
            
            VStack(alignment: .leading) {
                Text(GlobalConstant.NameString.cardScoreResult)
                    .font(.title)
                    .opacity(GlobalConstant.Opacity.strong)
                
                Text(date)
                    .font(.footnote)
                    .opacity(GlobalConstant.Opacity.meddle)
            }
            .padding(.leading, GlobalConstant.Padding.step12)
            
            Spacer()
            
            Text(maxScore)
                .font(sizeFont(geometry, multiplier: 2.5))
                .opacity(GlobalConstant.Opacity.strong)
        }
        .padding(.horizontal, GlobalConstant.Padding.step32)
        .frame(width: geometry.size.width,
               height: geometry.size.height)
        .background(
            themeData[theme.current].color
                .opacity(GlobalConstant.Opacity.weak)
        )
        .offset(x: gestureState.width)
        .animation(.spring(), value: gestureState)
    }
    
    private func gestureOnChange(_ value: DragGesture.Value) {
        if value.translation.width < .zero {
            gestureState = value.translation
        } else {
            gestureState = .zero
        }
    }
    
    private func gestureOnEnded(_ value: DragGesture.Value, _ geometry: GeometryProxy) {
        if value.translation.width < -geometry.size.width / 2 {
//            isShowAlert.toggle()
            gestureState = .zero
        } else {
            gestureState = .zero
        }
    }
    
    private func fastOnsetAndSlowOffset() -> CGFloat {
        if gestureState.width < -60 {
            return gestureState.width / 6
        } else {
            return 100 + gestureState.width * -2
        }
    }
    
    private func sizeFont(_ geometry: GeometryProxy, multiplier: Double) -> Font {
        Font.system(size: geometry.size.height / multiplier)
    }
}

//MARK: - PreviewProvider

struct CardScoreView_Previews: PreviewProvider {
    static let score = ScoreViewModel().scoreSheet
    static let date = ScoreViewModel().dateToString(score.date)
    
    static var previews: some View {
        OneCardScoreView(score.theme, date: date, maxScore: score.maxScore)
            .padding(.horizontal)
    }
}
