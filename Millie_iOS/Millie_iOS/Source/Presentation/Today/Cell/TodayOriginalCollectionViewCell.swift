//
//  TodayOriginalCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

import SnapKit

final class TodayOriginalCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "OriginalCollectionViewCell"
    
    private var originalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.todayOriginalImage
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
        self.addSubview(originalImageView)
    }
    
    private func setupLayout() {
        originalImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}
