//
//  CardOnboardView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 6.05.21.
//

import SwiftUI

//MARK: CardOnboardingView

struct CardOnboardingView: View {
    
    //MARK: Properties
    
    var cardOnboard: CardOnboard
    
    @State private var isAnimating = false
    
    private let gradient: Gradient
    private let height: CGFloat = 300
    private let width: CGFloat = 200
    private let lineSpacing: Double = 20
    
    private var stackSpacing: Double {
        isWithBangs ? 80 : 20
    }
    private var scale: CGFloat {
        isAnimating ? 0.8 : 0.3
    }
    private var titleOffset: CGFloat {
        isAnimating ? 0 : UIScreen.main.bounds.width + 200
    }
    private var headlineOffset: CGFloat {
        isAnimating ? 0 : UIScreen.main.bounds.width + 800
    }
    
    //MARK: Initializer
    
    init(_ cardOnboard: CardOnboard) {
        self.cardOnboard = cardOnboard
        gradient = Gradient(colors: cardOnboard.gradientColors)
    }
    
    var body: some View {
        VStack(spacing: stackSpacing) {
            Image(cardOnboard.image)
                .resizable()
                .scaledToFill()
                .shadow(color: .black.opacity(GlobalConstant.Opacity.meddle),
                        radius: 8, x: 6, y: 8)
                .frame(width: width, height: height)
                .scaleEffect(scale)
            
            VStack(spacing: lineSpacing) {
                Text(cardOnboard.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .offset(x: titleOffset)
                
                Text(cardOnboard.headline)
                    .offset(x: headlineOffset)
            }
            .foregroundColor(.defaultText)
            .multilineTextAlignment(.center)
            .shadow(color: .ruleShadow.opacity(GlobalConstant.Opacity.weak),
                    radius: 2, x: 2, y: 2)
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: gradient,
                                   startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(GlobalConstant.cornerRadius)
        .padding()
        
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
            CardOnboardingView(cardOnboardData[1])
                .preferredColorScheme(.dark)
        }
    }
}
