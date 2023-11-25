//
//  TodayHeaderView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/25/23.
//

import UIKit

import SnapKit

class TodayHeaderView: UITableViewHeaderFooterView {

    static let identifier: String = "TodayTableViewHeader"
    
    private var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.todayBanner
        return imageView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubview(bannerImageView)
    }
    
    private func setupLayout() {
        bannerImageView.snp.makeConstraints() {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(super.snp.width)
        }
    }
}
