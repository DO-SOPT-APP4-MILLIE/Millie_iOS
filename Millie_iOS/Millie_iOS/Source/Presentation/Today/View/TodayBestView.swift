//
//  NowBestView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

protocol TodayBestViewDelegate: AnyObject {
    func pushToBestViewController()
}

final class TodayBestView: UIView {
    
    weak var delegate: TodayBestViewDelegate?
    
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
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        bestCollectionView.register(TodayBestCollectionViewCell.self, forCellWithReuseIdentifier: TodayBestCollectionViewCell.identifier)
    }
    
    private func setupStyle() {
        self.backgroundColor = .milWhite
        
        bestCollectionView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        bestCollectionView.addGestureRecognizer(tapGesture)
    }
    
    private func setupHierarchy() {
        self.addSubviews(bestLabel, bestInfoLabel, bestButton, bestCollectionView)
    }
    
    private func setupLayout() {
        bestLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(3.adjusted)
            $0.leading.equalToSuperview().inset(24.adjusted)
        }
        
        bestInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(bestLabel.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(bestLabel.snp.leading)
        }
        
        bestButton.snp.makeConstraints() {
            $0.centerY.equalTo(bestLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(27.adjusted)
        }
        
        bestCollectionView.snp.makeConstraints() {
            $0.top.equalTo(bestInfoLabel.snp.bottom).offset(20.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(277.adjusted)
        }
    }
    
    @objc
    private func viewTapped(_ sender: UITapGestureRecognizer) {
        delegate?.pushToBestViewController()
    }
}
