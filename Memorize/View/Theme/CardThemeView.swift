//
//  CardThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

//MARK: CardThemeView

struct CardThemeView: View {
    
    //MARK: Properties

    let theme: Theme
    let selectedTheme: Int
    
    private let cardHeight = round( UIScreen.main.bounds.width / 1.8 )

    private var isActiveTheme: Bool {
        selectedTheme == theme.id
    }
    
    private var cardColor: Color {
        isActiveTheme ? theme.color : .defaultText.opacity(GlobalConstant.Opacity.meddle)
    }

    private var angleRotation: Angle {
        .degrees(isActiveTheme ? 0 : 22)
    }

    private var xOffset: CGFloat {
        isActiveTheme ? 0 : (isWithBangs ? 32 : 22)
    }
        
    //MARK: Initializer
    
    init(_ theme: Theme = plugTheme, _ selectedTheme: Int = 1) {
        self.theme = theme
        self.selectedTheme = selectedTheme
    }
    
    var body: some View {
        HStack {
            EmojiThemeView(theme, isActiveTheme)
            
            CardDescriptionThemeView(theme, isActiveTheme)
        }
        .frame(maxWidth: .infinity)
        .frame(height: cardHeight)
        .background(RoundedRectangle(cornerRadius: GlobalConstant.cornerRadius).fill(cardColor))
        .padding(.horizontal)
        .rotation3DEffect(angleRotation, axis: (x: 0, y: 1, z: 0))
        .offset(x: xOffset)
    }
}

struct CardTheme_Previews: PreviewProvider {
    static var previews: some View {
        let indexFoodCard = 1
        
        guard indexFoodCard < themeData.count else {
            return CardThemeView()
                .preferredColorScheme(.dark)
        }

        return CardThemeView(themeData[indexFoodCard], indexFoodCard)
            .preferredColorScheme(.dark)
    }
}
