//
//  TodayBestCollectionViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

final class TodayBestCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "BestCollectionViewCell"
    
    private var rankingLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .millieSubHeader6
        label.textColor = .darkGrey03
        return label
    }()
    
    private var rankingChangeLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = .millieSubHeader8
        label.textColor = .milBlack
        return label
    }()
    
    private var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.smallBookImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "기적의 자세"
        label.font = .millieSubHeader8
        label.textColor = .darkGrey03
        return label
    }()
    
    private var bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.text = "자세요정"
        label.font = .millieSubHeader8
        label.textColor = .darkGrey01
        return label
    }()
    
    private var bookInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "42% | 134분"
        label.font = .millieSubHeader8
        label.textColor = .darkGrey01
        return label
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
        self.addSubviews(rankingLabel, rankingChangeLabel, bookImageView, bookTitleLabel, bookAuthorLabel, bookInfoLabel)
    }
    
    private func setupLayout() {
        rankingLabel.snp.makeConstraints() {
            $0.bottom.equalTo(super.snp.centerY).offset(-1.adjusted)
            $0.leading.equalToSuperview().inset(3.adjusted)
        }
        
        rankingChangeLabel.snp.makeConstraints() {
            $0.top.equalTo(super.snp.centerY).offset(1.adjusted)
            $0.centerX.equalTo(rankingLabel.snp.centerX)
        }
        
        bookImageView.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(35.adjusted)
            $0.width.equalTo(61.adjusted)
            $0.height.equalToSuperview()
        }
        
        bookTitleLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(21.adjusted)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(17.adjusted)
        }
        
        bookAuthorLabel.snp.makeConstraints() {
            $0.top.equalTo(bookTitleLabel.snp.bottom)
            $0.leading.equalTo(bookTitleLabel.snp.leading)
        }
        
        bookInfoLabel.snp.makeConstraints() {
            $0.top.equalTo(bookAuthorLabel.snp.bottom)
            $0.leading.equalTo(bookTitleLabel.snp.leading)
        }
    }
}
