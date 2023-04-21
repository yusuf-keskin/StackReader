//
//  ApiService.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

final class ApiService : DataServiceProtocol {
    
    let urlBuilder : URLBuilderProtocol?
    let jsonParser : JsonDecoderProtocol?

    let session = URLSession.shared
    var items: [CoreModel] = []
        
    init(urlBuilder: URLBuilderProtocol, jsonParser : JsonDecoderProtocol) {
        self.urlBuilder = urlBuilder
        self.jsonParser = jsonParser
    }
    
    func fetchData(pagination : Bool ,forPage page: String, andTag tag : String?, completion : @escaping (_ data :[CoreModel], _ isOffline : Bool) -> () ) {
        
        if pagination {
            isPaginating = true
            print("************* --- FETCHING DATA --- *************")
        }
        
        guard let url = urlBuilder?.buildUrl(forPage: page, andTag: tag!) else {return}
        
        session.dataTask(with: url) { [self] data, _ , error in
            if let data = data {
                print("hey")
                let questionData = jsonParser?.decodeApiResponse(withData: data)
                add(newItem: questionData!)
                completion(questionData!,false)
                isPaginating = false
                print("************* --- FETCHING DATA ENDED --- *************")
                
            } else {
                print(error as Any)
                loadItemsFromCache { questionData in
                    completion(questionData,true)
                    isPaginating = false
                    print("************* --- FETCHING DATA ENDED --- *************")
                }
            }
        }.resume()
    }
    
    
    func add(newItem: [CoreModel] ){
        items.append(contentsOf: newItem)
        saveItemsToCache(modelArray : items)
    }
    
    var itemsCache: URL{
        get{
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) [0]
            documentsURL.removeAllCachedResourceValues()
            return documentsURL.appendingPathComponent("questionItems.dat")
        }
    }
    
    func saveItemsToCache(modelArray :[CoreModel]) {
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(items)
            try data.write(to: itemsCache)
        }catch{
            print("Error saving notif data items", error)
        }
    }
    
    func loadItemsFromCache(completion: @escaping(_ questionData: [CoreModel])->()) {
        do {
            guard FileManager.default.fileExists(atPath: itemsCache.path) else {
                print("No question data file exist yet")
                return
            }
            
            let data = try Data(contentsOf: itemsCache)
            let items = try JSONDecoder().decode([CoreModel].self, from: data)
            
            completion(items)
            
        } catch {
            print("Error loading notif data")
        }
    }
}
