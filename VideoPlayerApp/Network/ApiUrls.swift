//
//  ApiUrls.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 27.04.2023.
//

import Foundation

struct ApiUrls {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let additionalValues = "?api_key=3bb3e67969473d0cb4a48a0dd61af747&language=en-US"
    static let moviesAdditionals = "&sort_by=popularity.desc&include_adult=false&include_video=false&with_genres="
    static let sliderUrl  = baseUrl + "/movie/now_playing" + additionalValues
    static let movieListUrl  = baseUrl + "/discover/movie" + additionalValues
    static let genresUrl  = baseUrl + "/genre/movie/list" + additionalValues
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
}

struct VideoUrls {
    static let videoUrl = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
    
}
