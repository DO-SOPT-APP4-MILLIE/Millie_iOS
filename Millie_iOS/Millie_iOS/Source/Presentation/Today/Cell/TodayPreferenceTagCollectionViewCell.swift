//
//  TodayPreferenceTagCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/26/23.
//

import UIKit

import SnapKit

final class TodayPreferenceTagCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PreferenceTagCollectionViewCell"
    
    private var tagLabel = MillieTagView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubview(tagLabel)
    }
    
    private func setupLayout() {
        tagLabel.snp.makeConstraints() {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(31)
        }
    }
    
    public func dataBind(text: String) {
        tagLabel.label.text = text
    }
}
