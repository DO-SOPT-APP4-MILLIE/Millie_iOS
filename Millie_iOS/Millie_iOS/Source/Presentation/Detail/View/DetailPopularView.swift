//
//  DetailPopularView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailPopularView: UIView {
    
    public let popularTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "성별·연령별 인기 분포"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_popular_gragh")
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return imageView
    }()
    
    public let popularDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "이 책이 속한 경제경영 분야\n역시 20대 여성이 가장 즐겨보고 있어요."
        label.textColor = .darkGrey03
        label.font = .millieBody4
        label.textAlignment = .center
        label.numberOfLines = 2
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .lightGrey02
        
        return label
    }()
    
    private let divider = DetailDividerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        popularDescriptionLabel.partFontChange(targetStrings: ["경제경영 분야", "20대 여성"], font: .millieSubHeader4, textColor: .darkGrey03)
    }
    
    private func setupHierarchy() {
        self.addSubviews(popularTitleLabel,
                         popularImageView,
                         popularDescriptionLabel,
                         divider)
    }
    
    private func setupLayout() {
        popularTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        popularImageView.snp.makeConstraints {
            $0.top.equalTo(popularTitleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        popularDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(popularImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(74)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(popularDescriptionLabel.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
}
