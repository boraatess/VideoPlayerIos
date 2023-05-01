//
//  MoviesCollectionviewCell.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 27.04.2023.
//

import UIKit
import SnapKit


class MoviesCollectionviewCell: UICollectionViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let posterImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    private let movieName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Movie Title"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
   
    func detailConfigure(with viewModel: Detail.MovieList.ViewModel.DisplayedMovies) {
        let imageUrl = ApiUrls.imageUrl + viewModel.posterPath
        posterImage.kf.setImage(with: URL(string: imageUrl))
        movieName.text = viewModel.title
        
    }
    
    func layout() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        containerView.addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        containerView.addSubview(movieName)
        movieName.snp.makeConstraints { make in
            make.top.equalTo(self.posterImage.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(5)
            make.height.equalTo(20)
        }
    }
    
}
