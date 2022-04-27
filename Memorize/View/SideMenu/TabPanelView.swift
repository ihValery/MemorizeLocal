//
//  TabPanelView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

//MARK: TabPanelView

struct TabPanelView: View {
    
    //MARK: Properties
    
    @Binding var selectedTab: String
    
//    @ObservedObject var session: SessionFirebase
    
    //MARK: Initializer
    
    init(_ selectedTab: Binding<String>/*, _ session: SessionFirebase*/) {
        self._selectedTab = selectedTab
//        self.session = session
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GameBoardMainView(viewModelGame: GameBoardViewModel(), scoreListViewModel: ResultsTableViewModel())
                .tag(GlobalConstant.SideMenu.game)

            ScoreTableMainView()
                .tag(GlobalConstant.SideMenu.score)

            ThemeMainView()
                .tag(GlobalConstant.SideMenu.theme)

            NotificationView()
                .tag(GlobalConstant.SideMenu.notification)

            RulesView()
                .tag(GlobalConstant.SideMenu.rule)
        }
    }
}

struct Home_Previws: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
    }
}
