//
//  JsonParser.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

class JsonParser {
    func decodeApiResponse(withData data : Data) -> [QuestionData] {
        
        let questions = [QuestionData]()
        let decoder = JSONDecoder()
        do {
            let questions = try decoder.decode([QuestionData].self, from: data)
        } catch {
            print(ApiServiceError.parsingError.errorDescription as Any)
        }
        return questions
    }
    
}
