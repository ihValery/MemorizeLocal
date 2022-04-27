//
//  RulesView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import SwiftUI

//MARK: RulesView

struct RulesView: View {
    
    //MARK: InternalConstant
    
    fileprivate struct InternalConstant {
        static let title = "Правило"
        static let background = "backgroundRules"
        
        static let ruleOne = "Классическая игра «Мэмори» или «Найди пару!»."
        static let ruleTwo = "Направлена на эффективное развитие способности к запоминанию и концентрации внимания."
        static let ruleThree = "В начале игры на экран выставляются карты рубашкой вверх."
        static let ruleFour = "Игрок может в желаемой последовательности открывать карты."
        static let ruleFive = "Одновременно могут быть открыты только две карты."
        static let ruleSix = "Пара карт с одинаковой картинкой считаеться найденой, когда открыты одновременно лишь они."
    }
    
    //MARK: Properties
    
    private let cardSpacing: Double = 30
    private let paddingTop: CGFloat = -20
    
    private var offseBackground: CGFloat {
        isWithBangs ? 60 : -160
    }
    
    var body: some View {
        VStack {
            TitleTextStyleView(InternalConstant.title)
            
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    GeometryReader { gr in
                        Image(InternalConstant.background)
                            .resizable()
                            .offset(y: -gr.frame(in: .global).origin.y / 1.3 + offseBackground)
                    }
                    
                    VStack(spacing: cardSpacing) {
                        CardRuleView(title: InternalConstant.ruleOne).padding(.top, paddingTop)
                        CardRuleView(title: InternalConstant.ruleTwo)
                        CardRuleView(title: InternalConstant.ruleThree)
                        CardRuleView(title: InternalConstant.ruleFour)
                        CardRuleView(title: InternalConstant.ruleFive)
                        CardRuleView(title: InternalConstant.ruleSix)
                    }
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top)
                    
                }
                .ignoresSafeArea()
            }
        }
        .background(Color.ruleTop.ignoresSafeArea())
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
            .preferredColorScheme(.dark)
    }
}
