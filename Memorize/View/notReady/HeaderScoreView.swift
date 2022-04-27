//
//  HeaderScoreView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct HeaderScoreView: View {

    //MARK: - Properties

    @Binding var isAnimation: Bool
    
//    @ObservedObject var session: SessionFirebase
    
    //MARK: - Body

    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Spacer()
                    Text(/*session.user?.userName ??*/ "Нет игрока")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.leading).padding()
                }
                .offset(y: isAnimation ? 0 : getScreeSize().height)
                .animation(.spring(dampingFraction: 0.7).delay(1))
                
                Spacer()
            }
            .zIndex(1)
            
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    ImageWithURLView(/*session.user?.avatarURL ?? */"", size: 120)
                        .clipShape(CustomCorners(corner: .bottomRight, radius: 35))
                        .padding()
                        .padding(.trailing)
                        .offset(x: isAnimation ? 0 : -getScreeSize().height)
                        .animation(.spring(dampingFraction: 0.8).delay(0.7))
                }
            }
        }
    }
    
}
