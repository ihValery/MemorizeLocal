//
//  ImageLoaderAndCache.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 7.06.21.
//

import Foundation

final class ImageLoaderAndCache: ObservableObject {
    
    //MARK: - Properties
    
    @Published var imageData = Data()
    
    //MARK: - Initializer
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        let cache = URLCache.shared
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            self.imageData = data
        } else {
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let response = response {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.imageData = data
                    }
                }
            }.resume()
        }
    }
    
}
