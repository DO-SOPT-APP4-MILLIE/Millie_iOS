//
//  TodayMontlyCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayMonthlyCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "MonthlyCollectionViewCell"
    
    private var monthlyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubview(monthlyImageView)
    }
    
    private func setupLayout() {
        monthlyImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(_ image: UIImage) {
        monthlyImageView.image = image
    }
}
