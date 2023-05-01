//
//  GenresResponse.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//

import Foundation

// MARK: - CategoriesResponse
struct GenresResponse: Codable {
    var genres: [Genre]?
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}
