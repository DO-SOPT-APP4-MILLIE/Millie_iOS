//
//  DetailWeeklyBestBookView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailWeeklyBestBookView: UIView {
    
    public let bestBookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_trophy_line")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let bestBookTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "경제경영 분야 주간 베스트 도서"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    private let divider1 = DetailDividerView()
    
    public let bestBookCountLabel: UILabel = {
        let label = UILabel()
        label.text = "총 2권"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let bestBook1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_best_book1")
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        return imageView
    }()
    
    public let bestBook1TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "트렌드 코리아 2024"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        label.textAlignment = .left
        label.numberOfLines = 2
        
        return label
    }()
    
    public let bestBook1AuthorsLabel: UILabel = {
        let label = UILabel()
        label.text = "김난도, 전미영, …"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 14)
        
        return label
    }()
    
    public let bestBook2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_best_book2")
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        return imageView
    }()
    
    public let bestBook2TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "트렌드 코리아 2023"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        label.textAlignment = .left
        label.numberOfLines = 2
        
        return label
    }()
    
    public let bestBook2AuthorsLabel: UILabel = {
        let label = UILabel()
        label.text = "김난도, 전미영, …"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 14)
        
        return label
    }()
    
    private let divider2 = DetailDividerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubviews(bestBookImageView,
                         bestBookTitleLabel,
                         divider1,
                         bestBookCountLabel,
                         bestBook1ImageView,
                         bestBook1TitleLabel,
                         bestBook1AuthorsLabel,
                         bestBook2ImageView,
                         bestBook2TitleLabel,
                         bestBook2AuthorsLabel,
                         divider2)
    }
    
    private func setupLayout() {
        bestBookImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(24)
        }
        
        bestBookTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(bestBookImageView.snp.centerY)
            $0.leading.equalTo(bestBookImageView.snp.trailing).offset(11)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(bestBookTitleLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
        }
        
        bestBookCountLabel.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(24)
        }
        
        bestBook1ImageView.snp.makeConstraints {
            $0.top.equalTo(bestBookCountLabel.snp.bottom).offset(37)
            $0.leading.equalTo(bestBookCountLabel.snp.leading)
            $0.width.equalTo(103)
        }
        
        bestBook1TitleLabel.snp.makeConstraints {
            $0.top.equalTo(bestBook1ImageView.snp.bottom).offset(12)
            $0.leading.equalTo(bestBookCountLabel.snp.leading)
            $0.trailing.equalTo(bestBook1ImageView.snp.trailing)
        }
        
        bestBook1AuthorsLabel.snp.makeConstraints {
            $0.top.equalTo(bestBook1TitleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(bestBookCountLabel.snp.leading)
            $0.trailing.equalTo(bestBook1ImageView.snp.trailing)
        }
        
        bestBook2ImageView.snp.makeConstraints {
            $0.top.equalTo(bestBook1ImageView.snp.top)
            $0.leading.equalTo(bestBook1ImageView.snp.trailing).offset(16)
            $0.width.equalTo(103)
        }
        
        bestBook2TitleLabel.snp.makeConstraints {
            $0.top.equalTo(bestBook2ImageView.snp.bottom).offset(12)
            $0.leading.equalTo(bestBook2ImageView.snp.leading)
            $0.trailing.equalTo(bestBook2ImageView.snp.trailing)
        }
        
        bestBook2AuthorsLabel.snp.makeConstraints {
            $0.top.equalTo(bestBook2TitleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(bestBook2ImageView.snp.leading)
            $0.trailing.equalTo(bestBook2TitleLabel.snp.trailing)
        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(bestBook2AuthorsLabel.snp.bottom).offset(34)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
}
