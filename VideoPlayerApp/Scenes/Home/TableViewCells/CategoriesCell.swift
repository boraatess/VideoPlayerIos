//
//  CategoriesCell.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//

import UIKit
import SnapKit

class CategoriesCell: UITableViewCell {
    
    private let genreName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    let detailButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu_icon"), for: .normal)
        
        return button
    }()
    
    var movieList : [Home.FetchMovies.ViewModel.DisplayedMovies] = []
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        detailButton.addTarget(self, action: #selector(detailClicked), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    @objc func detailClicked() {
        print("detail clicked ...")
        
    }
    
    func configure(with viewModel: Home.FetchGenres.ViewModel.DisplayedGenres ) {
        genreName.text = viewModel.name
 
    }
    
    func layout() {
        contentView.backgroundColor = .white
        addSubview(genreName)
        genreName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(20)
        }
        
        addSubview(detailButton)
        detailButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
      
    }
    
}
