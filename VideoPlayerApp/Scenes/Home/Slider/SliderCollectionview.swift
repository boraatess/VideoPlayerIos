//
//  SliderCollectionview.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 27.04.2023.
//

import UIKit
import SnapKit

final class SliderCollectionview: UIView {
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.width)
        let collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0 ), collectionViewLayout: layout)
        collectionview.isPagingEnabled = true
        collectionview.register(SliderCollectionviewCell.self, forCellWithReuseIdentifier: SliderCollectionviewCell.description())
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.backgroundColor = .black
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.showsVerticalScrollIndicator = false
        return collectionview
    }()
    
    var sliders: [Home.FetchSlider.ViewModel.DisplayedSliders] = []

    init() {
        super.init(frame: .zero)
        
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
   
    }
    
}

extension SliderCollectionview {
    
    func configure(with viewModel: [Home.FetchSlider.ViewModel.DisplayedSliders]) {
        self.sliders = viewModel
        DispatchQueue.main.async {
            self.pageControl.numberOfPages = self.sliders.count
            self.collectionView.reloadData()
        }
   
        
    }
    
    private func configureLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        addSubview(pageControl)
        pageControl.snp.makeConstraints { (maker) in
            maker.leading.greaterThanOrEqualTo(self.snp.leading).offset(10)
            maker.trailing.lessThanOrEqualTo(self.snp.trailing).offset(-10)
            maker.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().inset(10)
            maker.height.equalTo(20)
        }
    }
    
}

extension SliderCollectionview: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliders.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionviewCell.description(), for: indexPath) as! SliderCollectionviewCell
        
        cell.contentView.backgroundColor = .clear
        cell.configure(with: sliders[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            if let row = collectionView.indexPath(for: cell)?.item {
                pageControl.currentPage = row
            }
        }
    }
    
}

extension SliderCollectionview: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: self.frame.width, height: 400)
    }
    
}
