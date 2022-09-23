//
//  JsonParser.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

final class JsonParser {

    var downloader = ImageDownloader()

    func decodeApiResponse(withData data : Data) -> [CoreModel] {
        
        let dateConverter : DateConverter = DateConverter()

                
        var questions = [CoreModel] ()
        let decoder = JSONDecoder()
        do {
            let mainData = try decoder.decode(DecodeModel.self, from: data)
            for question in mainData.items {
                var image : Data? = nil
                downloader.downloadImageData(withUrl: question.owner?.profileImage) { data in
                    image = data
                }

                let model = CoreModel(
                    title: question.title ?? "No Title",
                    tags: question.tags?.joined(separator: " , "),
                    viewCount: question.viewCount,
                    score: question.score,
                    creationDate: dateConverter.convertDateToEpoc(fromInt: question.creationDate!),
                    lastEditDate: dateConverter.convertDateToEpoc(fromInt: question.lastEditDate ?? 00) ,
                    questionID: question.questionID,
                    link: question.link,
                    body: question.body,
                    ownerReputation: question.owner?.reputation,
                    ownerProfileImageLink: question.owner?.profileImage,
                    ownerDisplayName : question.owner?.displayName,
                    imageData: image,
                    acceptedAnswer: ("https://stackoverflow.com/a/\(question.acceptedAnswer ?? 0)"))
                questions.append(model)
            }
        } catch {
            print(ApiServiceError.parsingError.localDescription as Any, error)
        }
        return questions
    }
    
}
