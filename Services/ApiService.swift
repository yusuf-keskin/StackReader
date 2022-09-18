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
    var dataTask : URLSessionDataTask?
    var downloadTask : URLSessionDownloadTask?
    
    var items: [Item] = []
    
    var isPaginating : Bool = false
    
    init(urlBuilder: URLBuilder, jsonParser : JsonParser) {
        self.urlBuilder = urlBuilder
        self.jsonParser = jsonParser
    }
    
    func fetchData(pagination : Bool = false, forPage page: String, andTag tag : String?, completion : @escaping (_ data :[Item], _ isOffline : Bool) -> () ) {
        
        if pagination{
            isPaginating = true
        }
        
        guard let url = urlBuilder?.buildUrl(forPage: page, andTag: tag!) else {return}
       
        let task = session.dataTask(with: url) { [self] data, _ , error in
            if let data = data {
                print("hey")
                let questionData = jsonParser?.decodeApiResponse(withData: data).items
                add(newItems: questionData ?? [Item]())
                completion(questionData!,false)
            } else {
                print(error as Any)
                loadItemsFromCache { questionData in
                    completion(questionData,true)
                    if pagination {
                        self.isPaginating = false
                    }
                }
            }
        }
        
        
        task.resume()
        isPaginating = false
        self.dataTask = task
        
    }
    

    func add(newItems: [Item]) {
      items.append(contentsOf: newItems)
      saveItemsToCache()
      }
    
  
    var itemsCache: URL{
        get{
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) [0]
            documentsURL.removeAllCachedResourceValues()
            return documentsURL.appendingPathComponent("questionItems.dat")
        }
    }
    
    func saveItemsToCache() {
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: itemsCache)
        }catch{
            print("Error saving notif data items", error)
        }
    }
    
    func loadItemsFromCache(completion: @escaping(_ questionData: [Item])->()) {
        do {
            guard FileManager.default.fileExists(atPath: itemsCache.path) else {
                print("No question data file exist yet")
                return
            }

            let data = try Data(contentsOf: itemsCache)
            let items = try JSONDecoder().decode([Item].self, from: data)

            completion(items)

        } catch {
            print("Error loading notif data")
        }
    }
}
