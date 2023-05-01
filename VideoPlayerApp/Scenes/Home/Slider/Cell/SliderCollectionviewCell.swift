//
//  SliderCollectionviewCell.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 27.04.2023.
//

import UIKit
import SnapKit

class SliderCollectionviewCell: UICollectionViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 2
        return view
    }()
    
    private let posterImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    private let movieName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let pageControl: UIPageControl = {
        let controller = UIPageControl()
        
        return controller
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: Home.FetchSlider.ViewModel.DisplayedSliders) {
        movieName.text = viewModel.title
        let imageUrl = ApiUrls.imageUrl + viewModel.backdropPath
        print("image url is : \(imageUrl)")
        
       // posterImageview.kf.setImage(with: URL(string: imageUrl))

        posterImage.kf.setImage(with: URL(string: imageUrl))
                
    }
    
    func layout() {
        addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            
        }
        addSubview(movieName)
        movieName.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(10)
            make.top.greaterThanOrEqualTo(self.posterImage.snp.centerY)
        }
        
        /*
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        
        containerView.addSubview(movieName)
        movieName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }*/
        
    }
    
}
