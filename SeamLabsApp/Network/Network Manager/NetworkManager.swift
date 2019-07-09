//
//  NetworkManager.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {
    
    static private let provider = MoyaProvider<MovieAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static private let jsonDecoder = JSONDecoder()
    
    
    
    //MARK:- GET THE TOP RATED MOVIES
    static func getMovies (completion : @escaping(_ success : Bool , _ error : Error? ,_ moviesData : [MovieResults]?)->Void) {
        
        provider.request(MovieAPI.topRated) { (response) in
            
            switch response.result {
                
            case .success(let value) :
                do {
                    let responseModel = try jsonDecoder.decode(MoviesModel.self, from: value.data).results
                    completion (true , nil ,responseModel)
                } catch(let error ){
                    completion(false , error , nil)
                }
            case .failure(let error):
                completion(false , error , nil)
            }
        }
    }
    
    
    //MARK:- LOGIN INTO APP MOVIES
    static func loginIntoApp( completion : @escaping(_ success : Bool , _ error : Error? )->Void) {
        
        provider.request(MovieAPI.login) { (response) in
            
            switch response.result {
                
            case .success(let value) :
                
                if value.statusCode >= 200 && value.statusCode <= 300 {
                    do {
                        let responseModel = try jsonDecoder.decode(LoginModel.self, from: value.data)
                        
                        let userDefaults = UserDefaults.standard
                        
                        // save username in user default for key username
                        userDefaults.set(RequestData.instance.usernameData , forKey: "username")
                        userDefaults.synchronize()
                        
                        // save password in user default for key password
                        userDefaults.set(RequestData.instance.passwordData, forKey: "password")
                        userDefaults.synchronize()
                        
                        // save request token in user default for key requestToken
                        userDefaults.set(responseModel.request_token, forKey: "requestToken")
                        userDefaults.synchronize()
                        
                        completion (true , nil )
                    } catch(let error ){
                        completion(false , error )
                    }
                } else {
                    completion(false , nil )
                }
                
            case .failure(let error):
                completion(false , error )
            }
        }
    }
    
    
    
    //MARK:- REQUEST NEW TOKEN REQIRED TO LOGIN 
    static func requestNewToken ( completion : @escaping(_ success : Bool , _ error : Error? )->Void) {
        
        provider.request(MovieAPI.requestToken) { (response) in
            
            switch response.result {
                
            case .success(let value) :
                
                if value.statusCode >= 200 && value.statusCode <= 300 {
                    do {
                        let responseModel = try jsonDecoder.decode(LoginModel.self, from: value.data)
                        
                        RequestData.instance.accessTokenData = responseModel.request_token
                        
                        completion (true , nil )
                    } catch(let error ){
                        completion(false , error )
                    }
                } else {
                    completion(false , nil  )
                }
                
            case .failure(let error):
                completion(false , error )
            }
        }
    }
}
