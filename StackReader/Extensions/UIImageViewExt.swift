//
//  UIImageViewExt.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 20.09.2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "fire.png")
            }
        }
    }
}

