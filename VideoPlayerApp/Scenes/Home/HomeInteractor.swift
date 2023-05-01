//
//  HomeInteractor.swift
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

protocol HomeBusinessLogic {
    
    func fetchGenres(request: Home.FetchGenres.Request)
    func movieList(genreId: String, request: Home.FetchMovies.Request)
    func sliderList(request: Home.FetchSlider.Request)

}

protocol HomeDataStore {
  //var name: String { get set }
    var genres : [Genre]? {get}
    var sliders: [SliderResult]? {get}
    var movies: [MovieResult]? {get}
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var movies: [MovieResult]?
    var sliders: [SliderResult]?
    var genres: [Genre]?
   
    var presenter: HomePresentationLogic?
    var worker = HomeWorker()

    func fetchGenres(request: Home.FetchGenres.Request) {
        worker.getGenres(successCompletion: { (response, error) in
            if let result = response {
                print("response is : \(result)")
                self.genres = result.genres
                if let genres = result.genres {
                    let response = Home.FetchGenres.Response.init(genres: genres)
                    self.presenter?.presentFetchedGenres(response: response)
                }
        
            }
            else {
                print(error ?? "error!...")
            }
        })
        
    }
    
    func movieList(genreId: String, request: Home.FetchMovies.Request) {
        worker.getMovieList(genreId: genreId) { response, error in
            if let result = response {
                print("response is : \(result)")
                self.movies = result.results
                if let movies = result.results {
                    let response = Home.FetchMovies.Response(movies: movies)
                    self.presenter?.presentFetchedMovies(response: response)
                }
        
            }
            else {
                print(error ?? "error!...")
            }
        }
        
    }
    
    func sliderList(request: Home.FetchSlider.Request) {
        worker.getSliderList(successCompletion: {(response, error) in
            if let result = response {
                print("response is : \(result)")
             
                self.sliders = result.results
                if let sliderImages = result.results {
                    let response = Home.FetchSlider.Response.init(sliders: sliderImages)
                    self.presenter?.presentFetchedSlider(response: response)
                }
        
            }
            else {
                print(error ?? "error!...")
            }
            
        })
    }
    
    
}
