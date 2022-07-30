//
//  Constants.swift
//  NetworkLayer
//
//  Created by Dev3 on 13/07/2022.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    struct Parameters {
        static let userId = "userId"
    }
    
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
