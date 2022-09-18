//
//  ApiService.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

class ApiService {
    static let instance = ApiService(urlBuilder: URLBuilder.init(), jsonParser: JsonParser.init())
    
    var urlBuilder : URLBuilder?
    var jsonParser : JsonParser?
    
    let session = URLSession.shared
    var urlTask : URLSessionDataTask?
    var downloadTask : URLSessionDownloadTask?
    
    init(urlBuilder: URLBuilder, jsonParser : JsonParser) {
        self.urlBuilder = urlBuilder
        self.jsonParser = jsonParser
    }
    
    func fetchData(forPage page: String, andTag tag : String?, completion : @escaping (_ data :[QuestionData]) -> () ) {

        guard let url = urlBuilder?.buildUrl(forPage: page, andTag: tag!) else {return}
        print(url)

        session.dataTask(with: url) { [self] data, _ , error in
            if let error = error {
                print(ApiServiceError.urlCreateError.description, error)
            } else {
                guard let data = data else {
                    print(ApiServiceError.dataFetchError.description)
                    return
                }
                let json = data as? Dictionary<String,Any>
                let array = json!["items"]
             
                let questionData = jsonParser?.decodeApiResponse(withData: array)
                completion(questionData!)
            }
        }.resume()
    }
    
}
