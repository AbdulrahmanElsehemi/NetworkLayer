//
//  ApiError.swift
//  NetworkLayer
//
//  Created by Dev3 on 30/07/2022.
//

import Foundation

enum ApiError : Error {
    
    case forbidden                 //Status code 403
    case notFound                 //Status code 404
    case conflict                //Status code 409
    case internalServerError    //Status code 500
 
}
