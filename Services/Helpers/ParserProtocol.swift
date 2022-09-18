//
//  ParserProtocol.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation
protocol ParserProtocol {
    func decodeApiResponse(withData data : Data?) -> [CoreModel]
}
