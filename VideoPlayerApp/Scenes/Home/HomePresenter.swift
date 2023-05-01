//
//  HomePresenter.swift
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

protocol HomePresentationLogic {
    func presentFetchedMovies(response: Home.FetchMovies.Response)
    func presentFetchedGenres(response: Home.FetchGenres.Response)
    func presentFetchedSlider(response: Home.FetchSlider.Response)

}

class HomePresenter: HomePresentationLogic {

    weak var viewController: HomeDisplayLogic?

    func presentFetchedMovies(response: Home.FetchMovies.Response) {
        var displayedMovies : [Home.FetchMovies.ViewModel.DisplayedMovies] = []

        for movie in response.movies {
            guard let title = movie.originalTitle, let posterPath = movie.posterPath, let backPath = movie.backdropPath else { return }
            
            let displayedMovie = Home.FetchMovies.ViewModel.DisplayedMovies(title: title, posterPath: posterPath, backdropPath: backPath)
            
            displayedMovies.append(displayedMovie)
            
        }
        
        
        let viewModel = Home.FetchMovies.ViewModel(displayedMovieList: displayedMovies)
        viewController?.displayeMovieList(viewModel: viewModel)
        
    }
    
    func presentFetchedGenres(response: Home.FetchGenres.Response) {
        var displayedGenres : [Home.FetchGenres.ViewModel.DisplayedGenres] = []
        
        for genre in response.genres {
            guard let id = genre.id, let genreName = genre.name else { return }
            
            let displayedGenre = Home.FetchGenres.ViewModel.DisplayedGenres(id: id, name: genreName)
            
            displayedGenres.append(displayedGenre)
            
            
        }
        
        let viewModel = Home.FetchGenres.ViewModel(displayedGenre: displayedGenres)
        viewController?.displayGenres(viewModel: viewModel)
        
    }
    
    func presentFetchedSlider(response: Home.FetchSlider.Response) {
        var displayedSliders: [Home.FetchSlider.ViewModel.DisplayedSliders] = []
        
        for slider in response.sliders {
            guard let title = slider.originalTitle, let posterPath = slider.posterPath, let backPath = slider.backdropPath else { return }
            
            let displayedSlider = Home.FetchSlider.ViewModel.DisplayedSliders(title: title, posterPath: posterPath, backdropPath: backPath)
            
            displayedSliders.append(displayedSlider)
            
        }
        
        let viewModel = Home.FetchSlider.ViewModel(displayedSliders: displayedSliders)
        viewController?.displayedSliderList(viewModel: viewModel)
        
        
    }
    
    
}