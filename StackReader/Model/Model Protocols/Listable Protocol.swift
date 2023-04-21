//
//  Listable Protocol.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 19.09.2022.
//

import Foundation

/// Filtering data for tableView cell
protocol Listable {
    var title : String { get set }
    var tags: String? { get set }
    var viewCount : Int? { get set }
}

let NETWORK_STATUS_NOTIFICATION = Notification.Name("NETWORK_STATUS_NOTIFICATION")
