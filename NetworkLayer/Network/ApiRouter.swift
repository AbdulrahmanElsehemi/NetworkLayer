//
//  ApiRouter.swift
//  NetworkLayer
//
//  Created by Dev3 on 13/07/2022.
//

import Foundation
import Alamofire

enum ApiRouter :URLRequestConvertible {
    
    //MARK: - EndPoint
    case getPosts(userId : Int)
    
    //MARK: - Path
    //The path is the part following the base url


    
    //MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        var urlRequest = URLRequest (url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        
        let encoding : ParameterEncoding = {
            switch method {
            case .get :
                return URLEncoding.default
            default :
                return JSONEncoding.default
            }
        }()
        
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
    //MARK: - Path
    //The path is the part following the base url

    private var path : String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method : HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters

    private var parameters : Parameters? {
        
        switch self {
        case .getPosts(let userId):
            //A dictionary of the key (From the constants file) and its value is returned
            return [Constants.Parameters.userId : userId]
        }
    }
    

}
