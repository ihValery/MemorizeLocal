//
//  CardRuleView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: CardRuleView

struct CardRuleView: View {
    
    //MARK: Properties
    
    let title: String
    
    private let cardRuleHeight: CGFloat = 170
        
    var body: some View {
        MatteEffectView()
            .cornerRadius(GlobalConstant.cornerRadius)
            .frame(height: cardRuleHeight)
            .overlay(
                Text(title)
                    .shadow(color: .ruleShadow, radius: 20, x: 0, y: 0)
                    .foregroundColor(.defaultText)
                    .padding()
            )
    }
}

struct CardRuleView_Previews: PreviewProvider {
    static var previews: some View {
        CardRuleView(title: "Example")
    }
}
