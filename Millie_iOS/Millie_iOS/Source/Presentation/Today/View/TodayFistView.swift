//
//  TodayFistView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayFistView: UIView {

    private var fistLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "이번 주 주목할 책"
        return label
    }()
    
    private var fistButton = UIButton.todayButton()
    public var fistCollectionView = UICollectionView.todayCollectionView()
    
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
        fistCollectionView.register(TodayFistCollectionViewCell.self, forCellWithReuseIdentifier: TodayFistCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.backgroundColor = .milWhite
        self.addSubviews(fistLabel, fistButton, fistCollectionView)
    }
    
    private func setupLayout() {
        fistLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(25.adjusted)
        }
        
        fistButton.snp.makeConstraints() {
            $0.centerY.equalTo(fistLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        fistCollectionView.snp.makeConstraints() {
            $0.top.equalTo(fistLabel.snp.bottom).offset(20.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(447.adjusted)
        }
    }
}
