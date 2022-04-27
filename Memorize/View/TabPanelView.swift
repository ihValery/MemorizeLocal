//
//  TabPanelView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct TabPanelView: View {
   @Binding var selectedTab: String
   @ObservedObject var session: SessionFirebase
   @State private var onAnimation = false
   
   init(selectedTab: Binding<String>, session: SessionFirebase) {
      self._selectedTab = selectedTab
      self.session = session
      UITabBar.appearance().isHidden = true
   }
   
   var body: some View {
      TabView(selection: $selectedTab) {
         GameBoardMainView(viewModelGame: GameBoardViewModel(), scoreListViewModel: ResultsTableViewModel()).tag("Новая игра")
         ScoreTableMainView(session: session, onAnimation: $onAnimation).tag("Счет")
            .onAppear {
               print("onAppear - Home - \(onAnimation)")
               onAnimation.toggle()
            }
            .onDisappear {
               print("onDisappear - Home - \(onAnimation)")
               onAnimation.toggle()
            }
         ThemeMainView().tag("Темы")
         NotificationView().tag("Уведомление")
         RulesView().tag("Правила")
      }
   }
}

struct Home_Previws: PreviewProvider {
   static var previews: some View {
      SideMenuMainView(session: SessionFirebase())
   }
}
