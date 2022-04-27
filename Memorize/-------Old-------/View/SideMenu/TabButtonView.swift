//
//  TabButtonView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

//MARK: TabButtonView

struct TabButtonView: View {

    //MARK: Properties
    
    var image: String
    var title: String
    //For Hero Animation Slide
    var animation: Namespace.ID
    
    @Binding var showMenu: Bool
    @Binding var selectedTab: String

    @ObservedObject private var theme = ThemeViewModel.shared
    
    @Environment(\.colorScheme) var colorScheme
    
    private let spacing: CGFloat = 15
    private let sizeIcon: CGFloat = 30
    private let uniforWidth: CGFloat = UIScreen.main.bounds.width * 3 / 5
    private let cornerRadius: CGFloat = GlobalConstant.cornerRadius - 10
    
    private var isActiveTab: Bool {
        selectedTab == title
    }
    private var paddingVertical: CGFloat? {
        isWithBangs ? nil : 10
    }
    private var colorButton: Color {
        isActiveTab ? themeData[theme.current].color : .defaultText
    }
    private var opacityBackground: CGFloat {
        colorScheme == .light ? 1 : GlobalConstant.Opacity.strong
    }
    
    //MARK: Initializer
    
    init(_ image: String, _ title: String, _ animation: Namespace.ID,
         _ showMenu: Binding<Bool>, _ selectedTab: Binding<String>) {
        
        self.image = image
        self.title = title
        self.animation = animation
        self._showMenu = showMenu
        self._selectedTab = selectedTab
    }
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = title
            }
            withAnimation(.spring()) {
                showMenu.toggle()
            }
        } label: {
            HStack(spacing: spacing) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: sizeIcon, height: sizeIcon)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(colorButton)
            .padding(.vertical, paddingVertical)
            .padding(.horizontal)
            .frame(maxWidth: uniforWidth, alignment: .leading)
            
            .background(
                //hero Animation
                ZStack {
                    if isActiveTab {
                        Color.defaultElement.opacity(opacityBackground)
                            .clipShape(CustomCorners(corner: [.topRight, .bottomRight],
                                                     radius: cornerRadius))
                            .matchedGeometryEffect(id: "TAB", in: animation)              //Магия )))

                    }
                }
            )
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView()
            .preferredColorScheme(.dark)
    }
}
