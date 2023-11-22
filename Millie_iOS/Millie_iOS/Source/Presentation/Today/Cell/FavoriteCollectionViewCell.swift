//
//  FavoriteCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

import SnapKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FavoriteCollectionViewCell"
    private var circleDiameter = 56.0
    
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "즐겨찾기"
        label.font = .millieBody7
        label.textColor = .milBlack
        return label
    }()
    
    private let favoriteCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        view.layer.borderColor = UIColor.lightGrey03.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let favoriteIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.thumbsUp
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        favoriteCircleView.layer.cornerRadius = circleDiameter/2
    }
    
    private func setupHierarchy() {
        self.addSubviews(favoriteLabel, favoriteCircleView)
        favoriteCircleView.addSubview(favoriteIconImageView)
    }
    
    private func setupLayout() {
        favoriteLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        favoriteCircleView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(circleDiameter)
        }
        
        favoriteIconImageView.snp.makeConstraints() {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
