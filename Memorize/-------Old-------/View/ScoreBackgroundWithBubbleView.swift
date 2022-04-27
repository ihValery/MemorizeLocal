//
//  ScoreBackgroundWithBubbleView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 29.06.21.
//

import SwiftUI

struct ScoreBackgroundWithBubbleView: View {
    @ObservedObject var theme = ThemeViewModel.shared
    
    var body: some View {
        ZStack {
            RectangleReverseAngle(startY: isWithBangs ? 165 : 125)
                .fill(Color.white)
            RectangleReverseAngle(startY: isWithBangs ? 165 : 125)
                .fill(LinearGradient(gradient: Gradient(colors: [themeData[theme.current].color.opacity(0.6), .sideMenuStart]), startPoint: .topTrailing, endPoint: .bottomLeading))
            BubbleBlowerView(color: themeData[theme.current].color, positionY: 250, frameCircle: 50...200)
                .clipShape(RectangleReverseAngle(startY: isWithBangs ? 165 : 125))
        }
    }
}

struct ScoreBackgroundWithBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBackgroundWithBubbleView()
    }
}
