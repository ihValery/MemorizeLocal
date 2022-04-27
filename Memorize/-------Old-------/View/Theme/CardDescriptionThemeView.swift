//
//  CardDescriptionThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 06.01.2022.
//

import SwiftUI

//MARK: CardDescriptionThemeView

struct CardDescriptionThemeView: View {
    
    //MARK: Properties
    
    let theme: Theme
    let isActiveTheme: Bool
    
    private var opacity: Double {
        isActiveTheme ? 1 : GlobalConstant.Opacity.meddle
    }
    private var paddingTrailing: CGFloat {
        isWithBangs ? 40 : 20
    }
    
    //MARK: Initializer
    
    init(_ theme: Theme, _ isActiveTheme: Bool) {
        self.theme = theme
        self.isActiveTheme = isActiveTheme
    }

    var body: some View {
        VStack {
            VStack {
                IconForThemeView(.age(trim: theme.ageFloat), theme, isActiveTheme)
                
                HStack {
                    IconForThemeView(.timer(trim: theme.timer), theme, isActiveTheme)
                    IconForThemeView(.level(trim: theme.levelFloat), theme, isActiveTheme)
                }
            }
            
            Text(theme.name)
                .font(.title3.bold())
                .lineLimit(1)
                .foregroundColor(.defaultText)
        }
        .opacity(opacity)
        .padding(.trailing, paddingTrailing)
    }
}

struct CardDescriptionThemeView_Previews: PreviewProvider {
    static var previews: some View {
        CardDescriptionThemeView(themeData.first!, true)
    }
}
