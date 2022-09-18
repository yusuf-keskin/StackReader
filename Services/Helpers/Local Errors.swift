//
//  Error Define.swift
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
    var localizedDescription: String {
        switch self {
        case .urlCreateError:
          return NSLocalizedString("Url creating failed.", comment: "URL Error")
        case .parsingError:
          return NSLocalizedString("Json parsing failed", comment: "Parsing Error")
        case .dataFetchError:
          return NSLocalizedString("Api response data is nil or invalid", comment: "Fetch Error")
        }
    }
}
