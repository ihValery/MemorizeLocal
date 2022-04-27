//
//  AnimationForAppearView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 27.05.21.
//

import SwiftUI

struct AnimationForAppearView: View {
    @State private var expand = true
    @ObservedObject var theme = ThemeViewModel.shared
    
    var body: some View {
        themeData[theme.current].color
            .ignoresSafeArea()
        Circle()
            .fill(Color.defaultElement)
            .scaleEffect(expand ? 0 : 3)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeIn(duration: 1))
            
            .onAppear {
                expand = false
            }
    }
}

struct AnimationForAppearView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationForAppearView()
    }
}
