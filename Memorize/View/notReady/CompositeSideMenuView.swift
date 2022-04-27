//
//  CompositeSideMenuView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

//MARK: CompositeSideMenuView

struct CompositeSideMenuView: View {
    
    //MARK: Properties
    
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    
    //For Hero Animation Slide
    @Namespace private var animation
    
//    @ObservedObject var session: SessionFirebase
    
    private let spacing: CGFloat = 15
    
    //MARK: Initializer

    init(_ selectedTab: Binding<String>, _ showMenu: Binding<Bool>/*, _ session: SessionFirebase*/) {
        self._selectedTab = selectedTab
        self._showMenu = showMenu
//        self.session = session
    }

    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            ProFileView()
            
            VStack(alignment: .leading) {
                TabButtonView("gamecontroller", "Новая игра", animation, $showMenu, $selectedTab)
                
                TabButtonView("clock.arrow.circlepath", "Счет", animation, $showMenu, $selectedTab)
                
                TabButtonView("bell.badge", "Уведомление", animation, $showMenu, $selectedTab)
                
                TabButtonView("gearshape", "Темы", animation, $showMenu, $selectedTab)
                
                TabButtonView("questionmark.circle", "Правила", animation, $showMenu, $selectedTab)
            }
            .padding(.leading, -spacing)
            .padding(.top, spacing * 3)
            
            Spacer()
            
            SignOutButtonView()
        }
        .padding(.leading)
        .padding(.top)
    }
    
}

struct CompositeSideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
            .preferredColorScheme(.dark)
    }
}
