//
//  URLBuilder.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 17.09.2022.
//

import Foundation

class URLBuilder{
    
    func buildUrl(forPage page : String? = "1" , andTag tag : String? = "swift") -> URL {
        var url: URL! {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.stackexchange.com"
            components.path = "/2.3/questions"
            components.query = "id=35"
            let a = "!"
            let b = "nKzQUR3Egv"
            components.queryItems = [
                URLQueryItem(name: "page", value: page),
                URLQueryItem(name: "pagesize", value: "40"),
                URLQueryItem(name: "order", value: "desc"),
                URLQueryItem(name: "max", value: "6"),
                URLQueryItem(name: "sort", value: "votes"),
                URLQueryItem(name: "tagged", value: tag),
                URLQueryItem(name: "site", value: "stackoverflow"),
                URLQueryItem(name: "filter", value: a+b),
            ]
            return components.url
        }
        return url
    }
}

