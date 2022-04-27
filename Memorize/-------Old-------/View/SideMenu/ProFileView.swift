//
//  ProFileView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

//MARK: - ProFileView

struct ProFileView: View {
    
    //MARK: InternalConstant
    
    fileprivate struct InternalConstant {
        static let avatar = ""
        static let name = "Без имени"
        static let email = "игрок@mail.net"
    }
    
    //MARK: Properties
    
//    @ObservedObject var session: SessionFirebase
    
    private let userAvatar: String = InternalConstant.avatar
    private let userName: String = InternalConstant.name
    private let userEmail: String = InternalConstant.email
    
    private let paddingTop: CGFloat = 30
    
    private var sizeImage: CGFloat {
        isWithBangs ? 180 : 160
    }
    
    //MARK: Initializer
    
//    init(session: SessionFirebase) {
//        self.session = session
//        userAvatar = session.user?.avatarURL ?? InternalConstant.avatar
//        userName = session.user?.userName ?? InternalConstant.name
//        userEmail = session.user?.email ?? InternalConstant.email
//    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageWithURLView(userAvatar, size: sizeImage)
                .padding(.top, paddingTop)
            
            VStack(alignment: .leading) {
                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)
                Text(userEmail)
                    .font(.subheadline)
                    .opacity(GlobalConstant.Opacity.strong)
            }
        }
        .foregroundColor(.defaultText)
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFileView()
            .preferredColorScheme(.dark)
    }
}
