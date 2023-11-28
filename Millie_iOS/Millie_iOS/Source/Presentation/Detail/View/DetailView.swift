//
//  DetailView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

import SnapKit

class DetailView: UIView {
    
    public let scrollView = UIScrollView()
    public let contentView = UIView()
    
    public let detailSelectCategoryView = DetailSelectCategoryView()
    public let detailBookDescriptionView = DetailBookDescriptionView()
    public let detailWandokView = DetailWandokView()
    public let detailPopularView = DetailPopularView()
    public let detailWeeklyBestBookView = DetailWeeklyBestBookView()
    public let detailMoreDescriptionView = DetailMoreDescriptionView()
    public let detailBottomView = DetailBottomView()
    
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
        self.backgroundColor = .white
        scrollView.backgroundColor = .white
        detailBottomView.backgroundColor = .white
        
        detailBookDescriptionView.archivedStackView.iconImageView.image = UIImage(named: "detail_profile")
        detailBookDescriptionView.archivedStackView.titleLabel.text = "이 책이 담긴 서재"
        
        detailBookDescriptionView.postStackView.iconImageView.image = UIImage(named: "detail_ic_post_line")
        detailBookDescriptionView.postStackView.titleLabel.text = "포스트"
        
        detailBookDescriptionView.reviewStackView.iconImageView.image = UIImage(named: "detail_ic_review_line")
        detailBookDescriptionView.reviewStackView.titleLabel.text = "한 줄 리뷰"
    }
    
    private func setupHierarchy() {
        self.addSubviews(scrollView, detailBottomView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(detailSelectCategoryView,
                              detailBookDescriptionView,
                              detailWandokView,
                              detailPopularView,
                              detailWeeklyBestBookView,
                              detailMoreDescriptionView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        detailSelectCategoryView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailBookDescriptionView.snp.makeConstraints {
            $0.top.equalTo(detailSelectCategoryView.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailWandokView.snp.makeConstraints {
            $0.top.equalTo(detailBookDescriptionView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailPopularView.snp.makeConstraints {
            $0.top.equalTo(detailWandokView.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailWeeklyBestBookView.snp.makeConstraints {
            $0.top.equalTo(detailPopularView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailMoreDescriptionView.snp.makeConstraints {
            $0.top.equalTo(detailWeeklyBestBookView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        detailBottomView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}
