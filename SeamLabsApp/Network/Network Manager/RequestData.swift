//
//  RequestData.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation

class RequestData{
    
    static let instance = RequestData()
    
    var movieApikey = getApiKey()
    var accessTokenData : String?
    var usernameData : String?
    var passwordData : String?
    
    static func getApiKey() -> String?
    {
        
        
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Movies", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            return nsDictionary?["apiKey"] as? String
        }
        
        return nil
    }
    
    
    
}
