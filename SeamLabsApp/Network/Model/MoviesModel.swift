//
//  NowPlayingModel.swift
//  My Cinema Movies
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation

struct MoviesModel : Codable {
    let results : [MovieResults]?
    let page : Int?
    let total_results : Int?
    let total_pages : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
    }
    
}

