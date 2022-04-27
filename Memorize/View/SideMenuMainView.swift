//
//  SideMenuMainView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI
import Firebase

struct SideMenuMainView: View {
   @State private var selectedTab = "Новая игра"
   //перед сборкой false
   @State private var showMenu = false
   @Environment(\.colorScheme) var colorScheme
   @ObservedObject var theme = ThemeViewModel.shared
   @ObservedObject var session: SessionFirebase
   
   var body: some View {
      ZStack {
         LinearGradient(gradient:
                           Gradient(colors: [.sideMenuStart.opacity(colorScheme == .dark ? 0.5 : 1),
                                             themeData[theme.current].color]),
                        startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
         
         ScrollView(isWithBangs ? .init() : .vertical, showsIndicators: false) {
            CompositeSideMenuView(selectedTab: $selectedTab, showMenu: $showMenu, session: session)
         }
         .frame(maxWidth: .infinity, alignment: .leading)
         
         ZStack {
            ZStack {
               TwoBackgroundCardView(showMenu: $showMenu)
               
               TabPanelView(selectedTab: $selectedTab, session: session)
                  .cornerRadius(showMenu ? 15 : 0)
                  .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: 0)
            }
            .rotation3DEffect(.degrees(showMenu ? 20 : 0), axis: (x: 0, y: 1, z: 0))
            
            //Подложка (Что бы нельзя было играть при открытом меню)
            if showMenu {
               Color.white
                  .opacity(0.01)
                  .onTapGesture {
                     withAnimation(.spring()) {
                        showMenu.toggle()
                     }
                  }
            }
         }
         //Масштабирование и перемещение вида
         .scaleEffect(showMenu ? 0.84 : 1)
         .offset(x: showMenu ? getRect().width - (isWithBangs ? 120 : 70) : 0)
         .ignoresSafeArea()
         .overlay(
            BurgerButtonView(showMenu: $showMenu)
            , alignment: .topLeading)
      }
      
      .popover(isPresented: $session.showOnboard) {
         OnboardingView()
      }
      
      /*
       //Сука 6 дней на поиск ошибки, просто гребанный sheet не работает, а popover на iPad не пашет
       //.fullScreenCover пашет
       //Thread 1: Simultaneous accesses to 0x7fcfc7e6fc50, but modification requires exclusive access
       .sheet(isPresented: $session.showOnboard, content: {
       OnboardingView()
       })
       */
   }
}

struct MainView_Previews: PreviewProvider {
   static var previews: some View {
      SideMenuMainView(session: SessionFirebase())
   }
}
