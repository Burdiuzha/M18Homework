//
//  CellMovie.swift
//  M18Homework
//
//  Created by Евгений Бурдюжа on 12.01.2022.
//

import Foundation
import UIKit
import SnapKit

class CellMovie: UITableViewCell {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionMovie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.contentMode = .scaleAspectFit
        //label.backgroundColor = .blue
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .brown
        stackView.addSubview(title)
        stackView.addSubview(descriptionMovie)
        stackView.addSubview(image)
        return stackView
    }()
    
//------------------------------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//-------------------------------------------------------------------
    
    private func setupViews() {
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
    
        stackView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
            maker.top.equalToSuperview().inset(16)
            maker.bottom.equalToSuperview().inset(0)
        }
        
        image.snp.makeConstraints { maker in
            maker.height.equalTo(50)
            maker.width.equalTo(50)
            maker.left.equalToSuperview()
            maker.top.equalToSuperview()
          }
        
        title.snp.makeConstraints { maker in
            maker.top.equalTo(image.snp.top)
            maker.left.equalTo(image.snp.left).offset(66)
        }
        
        descriptionMovie.snp.makeConstraints { maker in
            maker.top.equalTo(stackView.snp.top).offset(27)
            maker.bottom.equalTo(stackView.snp.bottom).offset(-16)
            maker.right.equalTo(stackView.snp.right).offset(-8)
            maker.left.equalTo(title.snp.left)
        }
        
    }
    
    func configure(_ viewModel: CellMovieModel ) {
        title.text = viewModel.title
        descriptionMovie.text = viewModel.description
        image.image = viewModel.image
    }
    
}

