//
//  MovieResponse.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 28.04.2023.
//

import Foundation

public class BaseResult<T: Decodable> : Decodable {

    var results: [T]?
    
    init(){}
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([T].self , forKey: .results)!
    }
}

struct MovieResponse: Decodable {
    var movies: [Movie]?
}


// MARK: - Movie
struct Movie: Codable {
    var page: Int?
    var results: [MovieResult]?

    enum CodingKeys: String, CodingKey {
        case page, results
    }
}

// MARK: - Result
struct MovieResult: Codable {
    var backdropPath: String?
    var id: Int?
    var originalTitle, overview: String?
    var posterPath, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
     
    }
}


