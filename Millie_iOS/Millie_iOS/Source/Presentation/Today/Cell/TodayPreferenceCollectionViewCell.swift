//
//  TodayPreferenceCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

class TodayPreferenceCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PreferenceCollectionViewCell"
    
    private var preferenceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.todayPreferenceImage
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
        self.addSubview(preferenceImageView)
    }
    
    private func setupLayout() {
        preferenceImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}
