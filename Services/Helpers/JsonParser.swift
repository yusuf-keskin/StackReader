//
//  JsonParser.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

class JsonParser {
    func decodeApiResponse(withData data : Data) -> DecodeModel {
        
        var questions : DecodeModel? = nil
        let decoder = JSONDecoder()
        do {
            let mainData = try decoder.decode(DecodeModel.self, from: data)
            questions = mainData
        } catch {
            print(ApiServiceError.parsingError.localDescription as Any, error)
        }
        return questions!
    }
    
}
