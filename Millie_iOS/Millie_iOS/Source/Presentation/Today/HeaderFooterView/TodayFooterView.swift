//
//  TodayFooterView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/25/23.
//

import UIKit

class TodayFooterView: UITableViewHeaderFooterView {

    static let identifier: String = "TodayTableViewFooter"
    
    private var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.todayFooter
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
        self.addSubview(infoImageView)
    }
    
    private func setupLayout() {
        infoImageView.snp.makeConstraints() {
            $0.bottom.width.equalToSuperview()
            $0.height.equalTo(361)
        }
    }
}
