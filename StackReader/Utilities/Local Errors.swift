//
//  Local Errors.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

enum ApiServiceError: LocalizedError  {
    case urlCreateError
    case parsingError
    case dataFetchError
}

extension ApiServiceError {
    var localDescription: String {
        switch self {
        case .urlCreateError:
            return "Url creating failed."
        case .parsingError:
            return "Json parsing failed"
        case .dataFetchError:
            return "Api response data is nil or invalid"
        }
    }
}

enum ImageServiceError: LocalizedError  {
    case dataError
}

extension ImageServiceError {
    var localDescription: String {
        switch self {
        case .dataError:
            return "Data is nil or invalid"
        }
    }
}


enum CoreDataError: LocalizedError  {
    case saveError
    case fetchError
    case deleteDataError
    case noManagedContext
}

extension CoreDataError {
    var localDescription: String {
        switch self {
        case .saveError:
            return "Save to Core Data failed"
        case .fetchError:
            return "Data fetch from Core Data failed"
        case .deleteDataError:
            return "Deleting saved data from Core Data failed"
        case .noManagedContext:
            return "No NSManagedContext found / created"
        }
    }
}
    
