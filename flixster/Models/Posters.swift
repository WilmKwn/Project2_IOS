//
//  Posters.swift
//  flixster
//
//  Created by William Kwon on 12/11/1401 AP.
//

import Foundation

struct PostersResponse : Decodable {
    var results: [Poster]
}

struct Poster : Decodable {
    var poster_path: String
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
}
