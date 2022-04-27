//
//  RulesView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 2.06.21.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Правила")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
                    .padding(.top, isWithBangs ? -5 : -1)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    GeometryReader { gr in
                        Image(Rule.background)
                            .resizable()
                            .offset(y: -gr.frame(in: .global).origin.y / 1.3 - 160)
                    }
                    
                    VStack(spacing: 30) {
                        CardRuleView(title: Rule.one).padding(.top, -20)
                        CardRuleView(title: Rule.two)
                        CardRuleView(title: Rule.three)
                        CardRuleView(title: Rule.four)
                        CardRuleView(title: Rule.five)
                        CardRuleView(title: Rule.six)
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

struct CardRuleView: View {
    let title: String
    
    var body: some View {
        MatteEffectView()
            .cornerRadius(25)
            .frame(height: 170)
            .overlay(
                Text(title)
                    .shadow(color: .ruleShadow, radius: 20, x: 0, y: 0)
                    .foregroundColor(.defaultText)
                    .padding()
            )
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
