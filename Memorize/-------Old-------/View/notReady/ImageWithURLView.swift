//
//  ImageWithURLView.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 7.06.21.
//

import SwiftUI

struct ImageWithURLView: View {
    
    //MARK: - Properties
    
    private var size: CGFloat
    
    @ObservedObject private var imageLoader: ImageLoaderAndCache
    
    //MARK: - Initializer
    
    init(_ url: String, size: CGFloat) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
        self.size = size
    }
    
    //MARK: - Body
    
    var body: some View {
        Image(uiImage: (UIImage(data: imageLoader.imageData) ?? UIImage(named: "noAvatar"))!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipped()
            .cornerRadius(25)
    }
    
}
