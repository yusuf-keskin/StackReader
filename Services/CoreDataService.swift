//
//  CoreDataService.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import UIKit
import CoreData

final class CoreDataService : ServiceProtocol {
    
    static let instance = CoreDataService (urlBuilder: URLBuilder.init(), jsonParser: JsonParser.init())
    
    var urlBuilder : URLBuilder?
    var jsonParser : JsonParser?
    let session = URLSession.shared
    var items = [CoreModel] ()
    
    init(urlBuilder: URLBuilder, jsonParser : JsonParser) {
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
                    print("************* --- FETCHING DATA HAS ENDED --- *************")
                }
            }
        }.resume()
        
    }
    
    func add(newItem: [CoreModel]) {
        cleanCoreDataStorage()
        items.append(contentsOf: newItem)
        saveItemsToCache(modelArray: newItem)
    }
    
    func saveItemsToCache(modelArray : [CoreModel]) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDelegate?.persistentContainer.viewContext else{
                print(CoreDataError.noManagedContext.errorDescription as Any)
                return
            }

            for model in modelArray {
                let newQuestion = NSEntityDescription.insertNewObject(forEntityName: "QuestionData", into: context)
                newQuestion.setValue(model.title, forKey: "title")
                newQuestion.setValue(model.tags, forKey: "tags")
                newQuestion.setValue(model.viewCount, forKey: "viewCount")
                newQuestion.setValue(model.score, forKey: "score")
                newQuestion.setValue(model.creationDate, forKey: "creationDate")
                newQuestion.setValue(model.questionID, forKey: "questionID")
                newQuestion.setValue(model.link, forKey: "link")
                newQuestion.setValue(model.body, forKey: "body")
                newQuestion.setValue(model.ownerReputation, forKey: "ownerReputation")
                newQuestion.setValue(model.ownerProfileImageLink, forKey: "ownerProfileImageLink")
                newQuestion.setValue(model.ownerDisplayName, forKey: "ownerDisplayName")
                newQuestion.setValue(model.lastEditDate, forKey: "lastEditDate")
                newQuestion.setValue(model.imageData, forKey: "imageData")
                
                do{
                    try context.save()
                } catch let error {
                    print(CoreDataError.saveError.localDescription, error)
                }
            }
        }
    }
    
    func cleanCoreDataStorage() {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDelegate?.persistentContainer.viewContext else{
                print(CoreDataError.noManagedContext.errorDescription as Any)
                return
            }
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "QuestionData")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try context.execute(batchDeleteRequest)
            } catch let error {
                print(CoreDataError.deleteDataError.localDescription, error)
            }
        }
    }
    
    func loadItemsFromCache(completion: @escaping ([CoreModel]) -> ()) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            guard let context = appDelegate?.persistentContainer.viewContext else{
                print(CoreDataError.noManagedContext.errorDescription as Any)
                return
            }
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "QuestionData")
            
            do{
                let questionsArray = try(context.fetch(fetchRequest) as? [QuestionData] )!
                print("Fetch succcesfull")
                var dataArray = [CoreModel]()
                var data : CoreModel?
                
                for question in questionsArray {
                    //Convert Int32 to Int
                    let viewCount = Int("\(question.viewCount)")
                    let score = Int("\(question.score)")
                    let questionID = Int("\(question.questionID)")
                    let ownerReputation = Int("\(question.ownerReputation)")
                    
                    data = CoreModel(title: question.title!, tags: question.tags, viewCount: viewCount, score: score, creationDate: question.creationDate, lastEditDate: question.lastEditDate, questionID: questionID, link: question.link, body: question.body, ownerReputation: ownerReputation, ownerProfileImageLink: question.ownerProfileImageLink, ownerDisplayName: question.ownerDisplayName, imageData : question.imageData, acceptedAnswer: question.acceptedAnswer)
                    
                    dataArray.append(data!)
                }
                
                completion(dataArray)
            } catch let error {
                print(CoreDataError.fetchError.localDescription, error)
            }
        }
        
    }
}
