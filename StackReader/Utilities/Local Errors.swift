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
