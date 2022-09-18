//
//  CoreModel.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation
import CoreData

struct CoreModel : CoreModelProtocol , Codable {
    
    var title: String

    var tags: String?
    
    var viewCount: Int?
    
    var score: Int?
    
    var creationDate: String?
    
    var lastEditDate: String?
    
    var questionID: Int?
    
    var link: String?
    
    var ownerTitle: String?
    
    var body: String?
    
    var ownerReputation: Int?
    
    var ownerProfileImageLink: String?
    
    var ownerDisplayName: String?
    
    var imageData: Data?
    

}
