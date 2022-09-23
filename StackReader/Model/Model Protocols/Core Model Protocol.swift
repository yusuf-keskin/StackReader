//
//  Core Model Protocol.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

protocol CoreModelProtocol : Decodable{
    var title : String { get set }
    var tags: String? { get set }
    var viewCount : Int? { get set }
    var score: Int? { get set }
    var creationDate : String? { get set }
    var lastEditDate : String? { get set }
    var questionID : Int? { get set }
    var link: String? { get set }
    var body: String? { get set }
    var ownerReputation: Int? { get set }
    var ownerProfileImageLink: String? { get set }
    var ownerDisplayName: String? { get set }
    var imageData: Data? { get set }
    var acceptedAnswer : String? { get set }
}
