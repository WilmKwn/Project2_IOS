//
//  Movies.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import Foundation

struct MoviesResponse: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var original_title: String
    var overview: String
    var popularity: Double
    
    var poster_path: String
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    
    var vote_average: Double
    var vote_count: Int
}
