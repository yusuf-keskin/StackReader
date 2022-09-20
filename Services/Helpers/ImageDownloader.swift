//
//  ImageDownloader.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

class ImageDownloader {
    var dataTask : URLSessionDataTask?
    func downloadImageData(withUrl url : URL) -> Data? {
        let session = URLSession.shared
        var imageData : Data?
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error, ImageServiceError.dataError.localDescription )
            } else {
                if (data != nil) {
                    imageData = data
                    
                }
            }
        }
        task.resume()
        return imageData
    }
}


