//
//  ImageDownloader.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

final class ImageDownloader {
    
    func downloadImageData(withUrl url : String?, completion: @escaping(_ data: Data?) -> () ) {
        
        guard let url = url else {
            print("No valid url")
            return
        }
        
        guard let imageUrl = URL(string: url) else {
            print("String cannot be casted as URL")
            return
        }
        
        let data = try? Data(contentsOf: imageUrl)
        completion(data)
    }
}


