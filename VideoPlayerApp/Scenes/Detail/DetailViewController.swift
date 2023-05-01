//
//  DetailViewController.swift
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

protocol DetailDisplayLogic: AnyObject {
    
    func displayMovies(viewModel: Detail.MovieList.ViewModel)
    
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    var interactor: DetailBusinessLogic?
    
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    var genreid: String?
    var genreName: String?

    public static var movieList : [Detail.MovieList.ViewModel.DisplayedMovies] = []
    var currentPage = 1
    var isPageRefreshing:Bool = false
    private let spacing:CGFloat = 4.0

    let screen = UIScreen.main.bounds
    // MARK: Object lifecycle
   
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.isPagingEnabled = false
        collectionview.register(MoviesCollectionviewCell.self, forCellWithReuseIdentifier: MoviesCollectionviewCell.description())
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .black
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.showsVerticalScrollIndicator = true
        return collectionview
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInteractor()
        layout()
        
    }
    
    // MARK: Do something
    func configureInteractor() {
        let request = Detail.MovieList.Request()
        interactor?.sendRequest(genreId: self.genreid ?? "", page: "1", pagination: false, movieList: DetailViewController.movieList, request: request)
    }
    
    func displayMovies(viewModel: Detail.MovieList.ViewModel) {
        print("displayed movie list view model : \(viewModel.displayedMovieList)")
        print("view model count: \(viewModel.displayedMovieList.count)")
        
        DetailViewController.movieList = viewModel.displayedMovieList
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
        
    }
    
}

extension DetailViewController {
    
    func layout() {
        navigationController?.navigationBar.backgroundColor = .white
        // print("genre id: \(self.genreid) genre name : \(self.genreName)")
        view.backgroundColor = .white
        title = genreName
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
      
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DetailViewController.movieList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionviewCell.description(), for: indexPath) as! MoviesCollectionviewCell
        let movieList = DetailViewController.movieList[indexPath.row]
        cell.detailConfigure(with: movieList)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieName = DetailViewController.movieList[indexPath.row].title
        router?.routeToVideoPlayer(movieName: movieName)
    }
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
            print("fetch more...")
            guard !DetailWorker().isPaginating else {
                return
            }
            collectionView.activityIndicator(show: true)
            print(currentPage)
            currentPage = currentPage + 1
            
            print("current page : \(currentPage)")
           
            let request = Detail.MovieList.Request()
            
            interactor?.sendRequest(genreId: self.genreid ?? "", page: "\(currentPage)", pagination: true, movieList: DetailViewController.movieList, request: request)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
   
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: collectionView.frame.size.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
