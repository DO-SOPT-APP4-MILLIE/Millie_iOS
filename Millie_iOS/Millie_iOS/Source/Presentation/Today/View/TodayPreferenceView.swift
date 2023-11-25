//
//  TodayPreferenceView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayPreferenceView: UIView {

    private var preferenceLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "이번 주 취향별 추천 책"
        return label
    }()
    
    private var preferenceButton = UIButton.todayButton()
    public var preferenceCollectionView = UICollectionView.todayCollectionView()
    public var preferenceTagCollectionView = UICollectionView.todayCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        
        setupStlye()
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        preferenceCollectionView.register(TodayPreferenceCollectionViewCell.self, forCellWithReuseIdentifier: TodayPreferenceCollectionViewCell.identifier)
        preferenceTagCollectionView.register(TodayPreferenceTagCollectionViewCell.self, forCellWithReuseIdentifier: TodayPreferenceTagCollectionViewCell.identifier)
    }
    
    private func setupStlye() {
        preferenceCollectionView.isScrollEnabled = false
    }
    
    private func setupHierarchy() {
        self.addSubviews(preferenceLabel, preferenceButton, preferenceTagCollectionView, preferenceCollectionView)
    }
    
    private func setupLayout() {
        preferenceLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(3.adjusted)
            $0.leading.equalToSuperview().inset(24.adjusted)
        }
        
        preferenceButton.snp.makeConstraints() {
            $0.centerY.equalTo(preferenceLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        preferenceTagCollectionView.snp.makeConstraints {
            $0.top.equalTo(preferenceLabel.snp.bottom).offset(18.5.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(31.adjusted)
        }
        
        preferenceCollectionView.snp.makeConstraints() {
            $0.top.equalTo(preferenceTagCollectionView.snp.bottom).offset(22.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(798.adjusted)
        }
    }
}
