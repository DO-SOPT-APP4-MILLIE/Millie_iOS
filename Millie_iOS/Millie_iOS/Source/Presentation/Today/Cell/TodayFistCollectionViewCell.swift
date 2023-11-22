//
//  TodayFistCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

class TodayFistCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FistCollectionViewCell"
    
    private var fistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.todayFistImage
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 13.0 //수정해야 함
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
        self.addSubview(fistImageView)
    }
    
    private func setupLayout() {
        fistImageView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}
