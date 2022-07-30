//
//  PostModel.swift
//  NetworkLayer
//
//  Created by Dev3 on 30/07/2022.
//

import Foundation


struct Post : Codable {
    
    let id : Int
    let title : String
    let body : String
    let userId : Int
}
