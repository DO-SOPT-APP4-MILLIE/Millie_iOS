//
//  TodayOriginalView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayOriginalView: UIView {

    private var originalLabel: UILabel = {
        let label = UILabel.todayLabel()
        label.text = "밀리 오리지널"
        return label
    }()
    
    private var originalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "오직 밀리에서만 볼 수 있어요"
        label.font = .millieBody5
        label.textColor = .darkGrey01
        return label
    }()
    
    private var originalButton = UIButton.todayButton()
    public var originalCollectionView = UICollectionView.todayCollectionView()
    public var originalTagCollectionView = UICollectionView.todayCollectionView()
    
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
        originalTagCollectionView.register(TodayOriginalTagCollectionViewCell.self, forCellWithReuseIdentifier: TodayOriginalTagCollectionViewCell.identifier)
        originalCollectionView.register(TodayOriginalCollectionViewCell.self, forCellWithReuseIdentifier: TodayOriginalCollectionViewCell.identifier)
    }
    
    private func setupHierarchy() {
        self.addSubviews(originalLabel, originalInfoLabel, originalButton, originalTagCollectionView, originalCollectionView)
    }
    
    private func setupLayout() {
        originalLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(3.adjusted)
            $0.leading.equalToSuperview().inset(24.adjusted)
        }
        
        originalInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(originalLabel.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(originalLabel.snp.leading)
        }
        
        originalButton.snp.makeConstraints() {
            $0.centerY.equalTo(originalLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        originalTagCollectionView.snp.makeConstraints() {
            $0.top.equalTo(originalInfoLabel.snp.bottom).offset(15.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(31.adjusted)
        }
        
        originalCollectionView.snp.makeConstraints() {
            $0.top.equalTo(originalTagCollectionView.snp.bottom).offset(22.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(309.adjusted)
        }
    }
}
