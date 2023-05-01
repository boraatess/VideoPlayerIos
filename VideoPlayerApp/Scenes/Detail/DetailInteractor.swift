//
//  DetailInteractor.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailBusinessLogic {
    
    func sendRequest(genreId: String, page: String, pagination: Bool, movieList : [Detail.MovieList.ViewModel.DisplayedMovies],request: Detail.MovieList.Request)
    
}

protocol DetailDataStore {
    var movies: [MovieResult]? {get}

}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
   
    var movies: [MovieResult]?
    var presenter: DetailPresentationLogic?
    
    var worker =  DetailWorker()
    
    func sendRequest(genreId: String, page: String, pagination: Bool,
                     movieList : [Detail.MovieList.ViewModel.DisplayedMovies], request: Detail.MovieList.Request) {
        
        guard !worker.isPaginating else {
            return
        }
        
        worker.getMovieList(genreId: genreId, page: page, pagination: pagination, successCompletion: { response, error in
            if let result = response {
                print("response is : \(result)")
                self.movies = result.results
                if let movies = result.results {
                    let response = Detail.MovieList.Response(movies: movies)
                    self.presenter?.presentFetchedMovies(movieList: movieList, response: response)
                }
        
            }
            else {
                print(error ?? "error!...")
            }
            
        })
    
    }
    
}