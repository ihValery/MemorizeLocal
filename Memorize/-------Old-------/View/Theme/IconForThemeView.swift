//
//  IconForThemeView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.05.21.
//

import SwiftUI

//MARK: IconForThemeView

struct IconForThemeView: View {
    
    //MARK: Properties
    
    let icon: IconForTheme
    let theme: Theme
    let activeTheme: Bool
    
    private let lineWidth: CGFloat = 5
    private var cardRotationAngle: Double {
        activeTheme ? 270 : -90
    }
    private var sizeIcon: CGFloat {
        isWithBangs ? 28 : 20
    }
    private var trimTo: CGFloat {
        activeTheme ? icon.forTrim : 0
    }
    
    //MARK: Initializer
    
    init(_ icon: IconForTheme, _ theme: Theme, _ activeTheme: Bool) {
        self.icon = icon
        self.theme = theme
        self.activeTheme = activeTheme
    }
    
    var body: some View {
        Image(icon.rawValue)
            .renderingMode(.template)
            .resizable()
            .foregroundColor(.defaultText)
            .frame(width: sizeIcon, height: sizeIcon)
            .padding()
            .background(
                ZStack {
                    theme.color
                    Circle()
                        .stroke(Color.black.opacity(GlobalConstant.Opacity.weak), lineWidth: lineWidth)
                    Circle()
                        .trim(from: 0, to: trimTo)
                        .stroke(Color.defaultText, lineWidth: lineWidth)
                }
                    .rotationEffect(
                        .degrees(cardRotationAngle)
                    )
            )
            .clipShape(Circle())
    }
}

struct IconForThemeView_Previews: PreviewProvider {
    static var previews: some View {
//        CardThemeView(theme: themeData.first!, selectedTheme: 1)
//            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 400))
        IconForThemeView(.age(trim: 8), themeData.first!, true)
            .preferredColorScheme(.dark)
    }
}
