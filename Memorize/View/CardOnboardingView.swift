//
//  CardOnboardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

struct CardOnboardingView: View {
    var cardOnboard: CardOnboard
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            VStack() {
                Spacer()
                
                Image(cardOnboard.image)
                    .resizable()
                    .scaledToFill()
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 6, y: 8)
                    .frame(width: 200, height: 300)
                    .padding(.bottom, 40)
                    .scaleEffect(isAnimating ? 0.8 : 0.3)
                
                VStack {
                    Text(cardOnboard.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
                        .offset(x: isAnimating ? 0 : getRect().width + 200)
                    
                    Text(cardOnboard.headline)
                        .padding(.horizontal, 16)
                        .offset(x: isAnimating ? 0 : getRect().width + 800)
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
//                .lineLimit(8)
                .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: cardOnboard.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .padding(.vertical)
        .padding(.horizontal, 15)
        
        .onAppear(perform: {
            isAnimating = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating = true
                }
            }
        })
    }
}

struct CardOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardOnboardingView(cardOnboard: cardOnboardData[1])
                .preferredColorScheme(.dark)
        }
    }
}
