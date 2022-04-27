//
//  EmojiThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 05.01.2022.
//

import SwiftUI

//MARK: EmojiThemeView

struct EmojiThemeView: View {
    
    //MARK: Properties
    
    let theme: Theme
    let isActiveTheme: Bool
    
    private var pivotEmoji: Double {
        isActiveTheme ? 10 : 0
    }
    private var opacityEmoji: Double {
        isActiveTheme ? 1 : GlobalConstant.Opacity.strong
    }
    private var opacityShadowEmoji: Double {
        isActiveTheme ? GlobalConstant.Opacity.strong : 0
    }
    private var radiusShadowEmoji: Double {
        isActiveTheme ? 10 : 0
    }
    private var yOffsetShadow: Double {
        isActiveTheme ? 30 : 0
    }
    private let xOffsetShadow: Double = 3
    
    private var occupiedSpace: CGFloat {
        UIScreen.main.bounds.width / 2
    }
    
    //MARK: Initializer
    
    init(_ theme: Theme, _ isActiveTheme: Bool) {
        self.theme = theme
        self.isActiveTheme = isActiveTheme
    }
    
    var body: some View {
        VStack {
            Text(theme.avatar)
                .font(.sizeEmojiTheme)
                .fixedSize()
                .opacity(opacityEmoji)
                .rotationEffect(.degrees(pivotEmoji)) //fixme
                .shadow(color: .black.opacity(opacityShadowEmoji),
                        radius: radiusShadowEmoji,
                        x: xOffsetShadow, y: yOffsetShadow)
        }
        .frame(maxWidth: occupiedSpace, alignment: .center)
    }
}

struct EmojiThemeView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiThemeView(themeData.first!, true)
    }
}
