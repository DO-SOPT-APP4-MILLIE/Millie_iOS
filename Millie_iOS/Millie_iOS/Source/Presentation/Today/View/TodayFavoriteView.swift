//
//  FavoriteView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

import SnapKit

final class TodayFavoriteView: UIView {

    private var favoriteLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "즐겨찾기"
        return label
    }()
    
    private var favoriteButton = UIButton.todayButton()
    public var favoriteCollectionView = UICollectionView.todayCollectionView()
    
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
        favoriteCollectionView.register(TodayFavoriteCollectionViewCell.self, forCellWithReuseIdentifier: TodayFavoriteCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.addSubviews(favoriteLabel, favoriteButton, favoriteCollectionView)
    }
    
    private func setupLayout() {
        favoriteLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24.adjusted)
        }
        
        favoriteButton.snp.makeConstraints() {
            $0.centerY.equalTo(favoriteLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        favoriteCollectionView.snp.makeConstraints() {
            $0.top.equalTo(favoriteButton.snp.bottom).offset(20.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(81.adjusted)
        }
    }
}
