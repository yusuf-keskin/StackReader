//
//  QuestionModel.swift.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

// MARK: - Welcome
struct QuestionData: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let tags: [String]?
    let owner: Owner?
    let viewCount, score: Int?
    let creationDate, lastEditDate, questionID : Int?
    let link: String?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case tags, owner
        case viewCount = "view_count"
        case score
        case questionID = "question_id"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case link, title, body
    }
}

// MARK: - Owner
struct Owner: Codable {
    let reputation: Int?
    let profileImage: String?
    let displayName: String?

    enum CodingKeys: String, CodingKey {
        case reputation
        case profileImage = "profile_image"
        case displayName = "display_name"
    }

}
