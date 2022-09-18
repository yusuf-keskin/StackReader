//
//  CoreModel.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

struct CoreModel : CoreModelProtocol , Codable {
    var title: String

    var tags: [String]?
    
    var viewCount: Int?
    
    var score: Int?
    
    var creationDate: Int?
    
    var lastEditDate: Int?
    
    var questionID: Int?
    
    var link: String?
    
    var ownerTitle: String?
    
    var body: String?
    
    var ownerReputation: Int?
    
    var ownerProfileImage: String?
    
    var ownerDisplayName: String?
    

}
