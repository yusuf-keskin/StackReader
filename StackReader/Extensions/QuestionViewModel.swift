//
//  QuestionModel.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 22.09.2022.
//



import Foundation

enum Storage {
    case coreData
    case fileSystem
}

protocol QuestionViewModelProtocol {
    func fetchData(storage : Storage, pagination: Bool, forPage page: String, andTag tag: String?, completion: @escaping ([CoreModel], Bool) -> ())
              
}

class QuestionViewModel: QuestionViewModelProtocol {
    
    let coreDataService : DataServiceProtocol
    let apiService : DataServiceProtocol

    init(coreDataService: DataServiceProtocol, apiService: DataServiceProtocol) {
        self.coreDataService = coreDataService
        self.apiService = apiService
    }

    
    func fetchData(storage : Storage, pagination: Bool, forPage page: String, andTag tag: String?, completion: @escaping ([CoreModel], Bool) -> ()) {
        
        

        switch storage {

        case .coreData:
            coreDataService.fetchData(pagination: pagination, forPage: page, andTag: tag) { data, isOffline in
                completion(data, isOffline)
            }
            
        case .fileSystem:
            apiService.fetchData(pagination: pagination, forPage: page, andTag: tag) { data, isOffline in
                completion(data, isOffline)
            }
            
        }
    }
}
