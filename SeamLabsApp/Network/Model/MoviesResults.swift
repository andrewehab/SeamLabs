//
//  MoviesResults.swift
//  My Cinema Movies
//
//  Created by AnDy on 7/8/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

    
    import Foundation
    
    struct MovieResults : Codable {
        let vote_count : Int?
        let id : Int?
        let video : Bool?
        let vote_average : Double?
        let title : String?
        let popularity : Double?
        let poster_path : String?
        let original_language : String?
        let original_title : String?
        let genre_ids : [Int]?
        let backdrop_path : String?
        let adult : Bool?
        let overview : String?
        let release_date : String?
        
        enum CodingKeys: String, CodingKey {
            
            case vote_count = "vote_count"
            case id = "id"
            case video = "video"
            case vote_average = "vote_average"
            case title = "title"
            case popularity = "popularity"
            case poster_path = "poster_path"
            case original_language = "original_language"
            case original_title = "original_title"
            case genre_ids = "genre_ids"
            case backdrop_path = "backdrop_path"
            case adult = "adult"
            case overview = "overview"
            case release_date = "release_date"
        }
        
        
    }
    
    struct Dates : Codable {
        let maximum : String?
        let minimum : String?
        
        enum CodingKeys: String, CodingKey {
            
            case maximum = "maximum"
            case minimum = "minimum"
        }
        
    }

   
