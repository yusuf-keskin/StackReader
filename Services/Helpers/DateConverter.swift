//
//  DateConverter.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 18.09.2022.
//

import Foundation

final class DateConverter {
    func convertDateToEpoc(fromInt int : Int) -> String {
        let date = NSDate(timeIntervalSince1970: Double(int))
        let dateString = String(describing: date).prefix(19)
        return String(dateString)
    }
}
