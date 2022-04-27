//
//  SideMenuMainView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI
//import Firebase

//MARK: SideMenuMainView

struct SideMenuMainView: View {
    
    //MARK: Properties
    
    @State private var selectedTab = GlobalConstant.SideMenu.game
    @State private var showMenu = true //FIXME: Before assembly false
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) private var colorScheme
    
//    @ObservedObject var session: SessionFirebase
    
    @ObservedObject private var theme = ThemeViewModel.shared
    
    private let cleanBadge: Int = 0
    private var gradient: Gradient {
        Gradient(colors: [.sideMenuStart.opacity(colorScheme == .dark ? 0.5 : 1),
                          themeData[theme.current].color])
    }
    private var cornerRadius: CGFloat {
        showMenu ? 25 : 0
    }
    private var rotationAngle: Angle {
        .degrees(showMenu ? 20 : 0)
    }
    private var scale: Double {
        showMenu ? 0.8 : 1
    }
    private var horizontalOffset: CGFloat {
        showMenu ? (UIScreen.main.bounds.width * 3 / 4) : 0
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView(isWithBangs ? .init() : .vertical, showsIndicators: false) {
                CompositeSideMenuView($selectedTab, $showMenu)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                ZStack {
                    TwoBackgroundCardView(showMenu)
                    
                    TabPanelView($selectedTab)
                        .cornerRadius(cornerRadius)
                        .shadow(color: .defaultText.opacity(GlobalConstant.Opacity.weak),
                                radius: 5, x: -5, y: 0)
                }
                
                //Подложка (Что бы нельзя было играть при открытом меню)
                if showMenu {
                    Color.white.opacity(GlobalConstant.Opacity.substrate)
                    
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                showMenu = false
                            }
                        }
                }
            }
            .rotation3DEffect(rotationAngle, axis: (x: 0, y: 1, z: 0))
            .offset(x: horizontalOffset)
            .scaleEffect(scale)
            .ignoresSafeArea()
            
            .overlay(
                BurgerButtonView(showMenu: $showMenu)
                , alignment: .topLeading
            )
        }
        
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UIApplication.shared.applicationIconBadgeNumber = cleanBadge
            }
        }
        
//        .popover(isPresented: $session.isShowOnboard) {
//            OnboardingView()
//        }
        
        /*
         //Сука 6 дней на поиск ошибки, просто гребанный sheet не работает, а popover на iPad не пашет
         //.fullScreenCover пашет
         //Thread 1: Simultaneous accesses to 0x7fcfc7e6fc50, but modification requires exclusive access
         .sheet(isPresented: $session.isShowOnboard, content: {
         OnboardingView()
         })
         */
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
    }
}
