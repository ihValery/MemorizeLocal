//
//  SignTopPanelView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 19.07.2021.
//

import SwiftUI

struct SignTopPanelView: View {
    @Binding var signInSelected: Bool
    
    var body: some View {
        HStack(spacing: 1) {
            SignSelectButtonView(text: "Вход")
                .opacity(!signInSelected ? 1 : 0.4)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        signInSelected = false
                    }
                }
            
            SignSelectButtonView(text: "Регистрация")
                .opacity(signInSelected ? 1 : 0.4)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        signInSelected = true
                    }
                }
        }
    }
}

struct SignTopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        SignTopPanelView(signInSelected: .constant(true))
    }
}
