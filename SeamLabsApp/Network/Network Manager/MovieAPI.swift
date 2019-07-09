//
//  MovieAPI.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    
    static private let apiKey = RequestData.instance.movieApikey
    
    case topRated
    case login
    case requestToken
}

extension MovieAPI : TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else {
            fatalError("Can't Configured Base URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .topRated :
            return("movie/top_rated")
        case .login :
            return ("authentication/token/validate_with_login")
        case .requestToken :
            return("authentication/token/new")
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .topRated , .requestToken:
            return .get
        case .login :
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
        
    }
    
    var parameters : [String : String] {
        switch self {
        case .topRated , .requestToken :
            return ["api_key" : MovieAPI.apiKey ?? "" ]
        case .login :
            return ["api_key" : MovieAPI.apiKey ?? ""  ,
                    "username": RequestData.instance.usernameData ?? "",
                    "password": RequestData.instance.passwordData ?? "",
                    "request_token": RequestData.instance.accessTokenData ?? ""
            ]
        }
    }
    
    var task: Task {
        switch self {
        case .topRated , .requestToken :
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .login :
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["content-type" : "application/json"]
    }
    
    var validationType: ValidationType{
        
        return .successCodes
    }
    
    
    
}
