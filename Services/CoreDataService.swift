//
//  CoreDataService.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

class CoreDataService : ServiceProtocol {
    
    static let instance = CoreDataService ()

    var items = [CoreModel] ()
    
    func fetchData(pagination: Bool, forPage page: String, andTag tag: String?, completion: @escaping ([CoreModel], Bool) -> ()) {
        
    }
    
    func add(newItem: [CoreModel]) {
        
    }
    
    func saveItemsToCache() {
        
    }
    
    func loadItemsFromCache(completion: @escaping ([CoreModel]) -> ()) {
        
    }
    
    
}
