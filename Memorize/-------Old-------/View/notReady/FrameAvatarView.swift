//
//  FrameAvatarView.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI


struct FrameAvatarView: View {
    
    //MARK: Properties
    
    @Binding var image: UIImage
    
    //MARK: Body
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 200, maxHeight: 200)
            .background(Color.white
                            .overlay(Text("Выберите\n фото")
                                        .foregroundColor(.signEnd)
                                        .font(.title2)
                                        .opacity(0.7)))
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.signEnd, lineWidth: 2)
                        .opacity(0.7))
            .multilineTextAlignment(.center)
    }
}
