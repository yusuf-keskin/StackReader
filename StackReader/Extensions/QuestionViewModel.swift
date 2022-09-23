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


class QuestionViewModel {
    func fetchData(storage : Storage, pagination: Bool, forPage page: String, andTag tag: String?, completion: @escaping ([CoreModel], Bool) -> ()) {
        
        switch storage {
            
        case .coreData:
            CoreDataService.instance.fetchData(pagination: pagination, forPage: page, andTag: tag) { data, isOffline in
                completion(data, isOffline)
            }
            
        case .fileSystem:
            ApiService.instance.fetchData(pagination: pagination, forPage: page, andTag: tag) { data, isOffline in
                completion(data, isOffline)
            }
            
        }
    }
}
