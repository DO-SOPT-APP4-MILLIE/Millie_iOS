//
//  TodayPreferenceView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

class TodayPreferenceView: UIView {

    private var preferenceLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "밀리 오리지널"
        return label
    }()
    
    private var preferenceButton = UIButton.todayButton()
    public var preferenceCollectionView = UICollectionView.todayCollectionView()
    
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
    }
    
    private func setupStlye() {
        preferenceCollectionView.isScrollEnabled = false
    }
    
    private func setupHierarchy() {
        self.addSubviews(preferenceLabel, preferenceButton, preferenceCollectionView)
    }
    
    private func setupLayout() {
        preferenceLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(3)
            $0.leading.equalToSuperview().inset(24)
        }
        
        preferenceButton.snp.makeConstraints() {
            $0.centerY.equalTo(preferenceLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(31)
        }
        
        preferenceCollectionView.snp.makeConstraints() {
            $0.top.equalTo(preferenceLabel.snp.bottom).offset(68)
            $0.width.equalToSuperview()
            $0.height.equalTo(798)
        }
    }
}
