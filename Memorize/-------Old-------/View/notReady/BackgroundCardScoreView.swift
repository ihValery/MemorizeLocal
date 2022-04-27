//
//  BackgroundCardScoreView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 28.06.21.
//

import SwiftUI

struct BackgroundCardScoreView: View {
    
    //MARK: - Properties
    
    @ObservedObject private var theme = ThemeViewModel.shared
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(themeData[theme.current].color).opacity(0.1)
                .cornerRadius(6)
                .clipShape(CustomCorners(corner: [.topLeft, .bottomRight], radius: 60))
                .frame(height: 120)
        }
        .padding()
    }
    
}
