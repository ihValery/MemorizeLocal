//
//  ImageWithURLView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 7.06.21.
//

import SwiftUI

struct ImageWithURLView: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache
    var size: CGFloat
    
    init(_ url: String, size: CGFloat) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
        self.size = size
    }
    
    var body: some View {
        Image(uiImage: (UIImage(data: imageLoader.imageData) ?? UIImage(named: "noAvatar"))!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipped()
            .cornerRadius(25)
    }
}
