//
//  DateConverter.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

protocol DateConverterProtocol {
    func convertDateToEpoc(fromInt int : Int) -> String
}

final class DateConverter : DateConverterProtocol {
    func convertDateToEpoc(fromInt int : Int) -> String {
        let date = NSDate(timeIntervalSince1970: Double(int))
        let dateString = String(describing: date).prefix(19)
        return String(dateString)
    }
}
