//
//  TabButtonView.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

struct TabButtonView: View {
    var image: String
    var title: String
    
    @ObservedObject var theme = ThemeViewModel.shared
    @Binding var showMenu: Bool
    @Binding var selectedTab: String
    //For Hero Animation Slide
    var animation: Namespace.ID
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = title
            }
            withAnimation(.easeIn.delay(0.2)) {
                showMenu.toggle()
            }
        } label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? themeData[theme.current].color : .defaultText)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .frame(maxWidth: getRect().width * 3 / 5, alignment: .leading)
            .background(
                //hero Animation
                ZStack {
                    if selectedTab == title {
                        Color.defaultElement.opacity(colorScheme == .light ? 1 : 0.5)
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corner: [.topRight, .bottomRight], radius: 13))
                            //Магия )))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMainView(session: SessionFirebase())
            .preferredColorScheme(.dark)
    }
}
