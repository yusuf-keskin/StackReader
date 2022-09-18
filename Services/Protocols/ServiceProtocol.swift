//
//  ApiServiceProtocol.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

protocol ServiceProtocol {
    var items: [CoreModel] { get set }
    func fetchData(pagination : Bool , forPage page: String, andTag tag : String?, completion : @escaping (_ data :[CoreModel], _ isOffline : Bool) -> () )
    func add(newItem: [CoreModel] )
    func saveItemsToCache(modelArray : [CoreModel])
    func loadItemsFromCache(completion: @escaping(_ questionData: [CoreModel])->())

}
