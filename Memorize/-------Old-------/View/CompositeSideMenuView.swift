//
//  CompositeSideMenuView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct CompositeSideMenuView: View {
    @Binding var selectedTab: String
    //For Hero Animation Slide
    @Namespace var animation
    @Binding var showMenu: Bool
    @ObservedObject var session: SessionFirebase

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ProFileView(session: session)

            VStack(alignment: .leading, spacing: 10) {
                TabButtonView(image: "gamecontroller", title: "Новая игра", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "clock.arrow.circlepath", title: "Счет", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "bell.badge", title: "Уведомление", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "gearshape", title: "Темы", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
                
                TabButtonView(image: "questionmark.circle", title: "Правила", showMenu: $showMenu, selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            
            Spacer()
            
            SignOutButtonView(session: session)
        }
        .padding(.leading, 14)
        .padding(.top)
    }
}

struct CompositeSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
