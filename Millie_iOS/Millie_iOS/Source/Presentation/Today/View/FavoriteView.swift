//
//  FavoriteView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

class FavoriteView: UIView {

    private var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "즐겨찾기"
        label.font = .millieHeader3
        label.textColor = .milBlack
        return label
    }()
    
    private var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.arrowRight, for: .normal)
        return button
    }()
    
    public var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        favoriteCollectionView.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.addSubviews(favoriteLabel, favoriteButton, favoriteCollectionView)
    }
    
    private func setupLayout() {
        favoriteLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        favoriteButton.snp.makeConstraints() {
            $0.centerY.equalTo(favoriteLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(31)
        }
        
        favoriteCollectionView.snp.makeConstraints() {
            $0.top.equalTo(favoriteButton.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(81)
        }
    }
}
