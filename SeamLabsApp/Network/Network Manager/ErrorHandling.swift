//
//  ErrorHandling.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/9/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation
import Alamofire

class ErrorHandling {
    
    static let instance = ErrorHandling()
    
    func checkError() -> String {
        
        var errorDesp : String
        
        if NetworkReachabilityManager()!.isReachable == false {
            errorDesp = "Please Check Your Internet Connection"
        } else {
            errorDesp = "Something Went Wrong , Please Check Your Username or Password"
        }
        
        return errorDesp
    }
    
}
