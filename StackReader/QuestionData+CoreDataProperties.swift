//
//  QuestionData+CoreDataProperties.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//
//

import Foundation
import CoreData


extension QuestionData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionData> {
        return NSFetchRequest<QuestionData>(entityName: "QuestionData")
    }

    @NSManaged public var body: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var lastEditDate: String?
    @NSManaged public var link: String?
    @NSManaged public var ownerDisplayName: String?
    @NSManaged public var ownerProfileImageLink: String?
    @NSManaged public var ownerReputation: Int32
    @NSManaged public var questionID: Int32
    @NSManaged public var score: Int32
    @NSManaged public var tags: String?
    @NSManaged public var title: String?
    @NSManaged public var viewCount: Int32

}

extension QuestionData : Identifiable {

}
