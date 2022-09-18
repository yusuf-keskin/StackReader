//
//  Core Model Protocol.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

protocol CoreModelProtocol : Decodable{
    var title : String { get set }
    var tags: [String]? { get set }
    var viewCount : Int? { get set }
    var score: Int? { get set }
    var creationDate : Int? { get set }
    var lastEditDate : Int? { get set }
    var questionID : Int? { get set }
    var link: String? { get set }
    var ownerTitle: String? { get set }
    var body: String? { get set }
    var ownerReputation: Int? { get set }
    var ownerProfileImage: String? { get set }
    var ownerDisplayName: String? { get set }
}
