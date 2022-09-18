//
//  JsonParser.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

class JsonParser {
    func decodeApiResponse(withData data : Data) -> [CoreModel] {
        
        var questions = [CoreModel] ()
        let decoder = JSONDecoder()
        do {
            let mainData = try decoder.decode(DecodeModel.self, from: data)
            for question in mainData.items {
                let model = CoreModel(
                    title: question.title ?? "No Title",
                    tags: question.tags,
                    viewCount: question.viewCount,
                    score: question.score,
                    creationDate: question.creationDate,
                    lastEditDate: question.lastEditDate,
                    questionID: question.questionID,
                    link: question.link,
                    ownerTitle: question.title,
                    body: question.body,
                    ownerReputation: question.owner?.reputation,
                    ownerProfileImage: question.owner?.profileImage,
                    ownerDisplayName: question.owner?.displayName)
                questions.append(model)
            }
        } catch {
            print(ApiServiceError.parsingError.localDescription as Any, error)
        }
        return questions
    }
    
}
