//
//  CustomScrollview.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 27.04.2023.
//

import UIKit

final class CustomScrollview: UIScrollView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        let contentInset = UIView()
        contentInset.heightAnchor.constraint(equalToConstant: 16).isActive = true
        stackView.addArrangedSubview(contentInset)
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.leading.trailing.top.bottom.equalToSuperview()
            maker.width.equalToSuperview()
        }
    }
}
