//
//  BackgroundCardSignView.swift
//  SwiftUI_Firebase
//
//  Created by Валерий Игнатьев on 28.05.21.
//

import SwiftUI

struct BackgroundCardSignView: View {
    
    //MARK: - Properties

    var height: CGFloat
    
//    @ObservedObject var session: SessionFirebase
    
    @ObservedObject private var signViewModel = SignViewModel.shared
    
    //MARK: - Initializer
    
    init(height: CGFloat/*, _ session: SessionFirebase*/) {
        self.height = height
//        self.session = session
    }
    
    //MARK: - Body

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.white).opacity(0.6)
                .overlay(
                    VStack {
                        Spacer()
                        ZStack {
                            Text(signViewModel.messageError)
//                            Text(session.errorMessage)
                        }
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .padding(.bottom, 10)
                    })
                .frame(height: height)
//                .offset(y: signViewModel.messageError.isEmpty && session.errorMessage.isEmpty ? 20 : 70)
                .padding(.horizontal, 30)
            
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.white).opacity(0.6)
                .frame(height: height)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                .offset(y: 10)
                .padding(.horizontal, 15)
            
            RoundedRectangle(cornerRadius: 7)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                .frame(height: height)
        }
        .padding(.horizontal)
    }
    
}

struct BackgroundCardSignView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCardSignView(height: 450)
    }
}
