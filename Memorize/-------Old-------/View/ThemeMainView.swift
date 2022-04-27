//
//  ThemeMainView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import SwiftUI

struct ThemeMainView: View {
    @ObservedObject var theme = ThemeViewModel.shared
    @State private var selectedTheme: Int = UserDefaults.standard.integer(forKey: "Theme")
    
    var body: some View {
        VStack {
            HStack {
                Text("Выбери тему")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.leading, 60)
                    .padding(.top, isWithBangs ? -5 : -1)
                    .padding(.bottom, -1)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(themeData) { item in
                        CardThemeView(theme: item, selectedTheme: selectedTheme)
                            .padding(.vertical)
                            .onTapGesture {
                                theme.current = item.id
                                withAnimation(.easeInOut) {
                                    selectedTheme = theme.current
                                }
                            }
                    }
                }
                .padding(.top)
            }
        }
        .background(LinearGradient(gradient: Gradient(colors:[themeData[theme.current].color.opacity(0.4), .sideMenuStart]),
                                   startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea())
    }
}

struct ThemeMainView_Previews: PreviewProvider {
    static var previews: some View {
       ThemeMainView()
    }
}
