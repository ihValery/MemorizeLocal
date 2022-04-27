//
//  ProFileView.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 24.05.21.
//

import SwiftUI

struct ProFileView: View {
    @ObservedObject var session: SessionFirebase
    
    var body: some View {  
        VStack(alignment: .leading) {
            ImageWithURLView(session.user?.avatarURL ?? "", size: isWithBangs ? 180 : 160)
                .padding(.top, 30)
            
            VStack(alignment: .leading) {
                Text(session.user?.userName ?? "Без имени")
                    .font(.title)
                    .fontWeight(.bold)
                Text(session.user?.email ?? "игрок@mail.net")
                    .font(.subheadline)
                    .opacity(0.8)
            }
        }
        .foregroundColor(.defaultText)
    }
}

struct ProFile_Previews: PreviewProvider {
    static var previews: some View {
        ProFileView(session: SessionFirebase())
          .preferredColorScheme(.dark)
    }
}
