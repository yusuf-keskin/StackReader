//
//  Stroyboarded.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import Foundation
import UIKit

protocol Storyboarded {
    
    static func instantiate () -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate () -> Self{
        
        let id = String(describing: self)
              
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

