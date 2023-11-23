//
//  NowBestView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

class TodayBestView: UIView {
    
    private var bestLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "지금! 서점 베스트"
        return label
    }()
    
    private var bestInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "서점 3사 100위 내, 70권을 밀리에서 만나보세요"
        label.font = .millieBody5
        label.textColor = .darkGrey01
        return label
    }()
    
    private var bestButton = UIButton.todayButton()
    public var bestCollectionView = UICollectionView.todayCollectionView()
    
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
        bestCollectionView.register(TodayBestCollectionViewCell.self, forCellWithReuseIdentifier: TodayBestCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.addSubviews(bestLabel, bestInfoLabel, bestButton, bestCollectionView)
    }
    
    private func setupLayout() {
        bestLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(3)
            $0.leading.equalToSuperview().inset(24)
        }
        
        bestInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(bestLabel.snp.bottom).offset(8)
            $0.leading.equalTo(bestLabel.snp.leading)
        }
        
        bestButton.snp.makeConstraints() {
            $0.centerY.equalTo(bestLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27)
        }
        
        bestCollectionView.snp.makeConstraints() {
            $0.top.equalTo(bestInfoLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview()
            $0.height.equalTo(277)
        }
    }
}
