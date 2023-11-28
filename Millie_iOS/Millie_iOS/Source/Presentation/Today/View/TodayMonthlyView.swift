//
//  TodayMontlyView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayMonthlyView: UIView {
    
    private var monthlyLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "한 달 이내에 출간된 책"
        return label
    }()
    
    private var monthlyButton = UIButton.todayButton()
    public var monthlyCollectionView = UICollectionView.todayCollectionView()
    
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
        monthlyCollectionView.register(TodayMonthlyCollectionViewCell.self, forCellWithReuseIdentifier: TodayMonthlyCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.addSubviews(monthlyLabel, monthlyButton, monthlyCollectionView)
    }
    
    private func setupLayout() {
        monthlyLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(13.5.adjusted)
            $0.leading.equalToSuperview().inset(25.adjusted)
        }
        
        monthlyButton.snp.makeConstraints() {
            $0.centerY.equalTo(monthlyLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        monthlyCollectionView.snp.makeConstraints() {
            $0.top.equalTo(monthlyLabel.snp.bottom).offset(23.5.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(582.adjusted)
        }
    }
}
