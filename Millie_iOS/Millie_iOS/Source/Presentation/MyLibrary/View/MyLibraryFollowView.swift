//
//  MyLibraryFollowView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class MyLibraryFollowView: UIView {
    
    public let followLabel: UILabel = {
        let label = UILabel()
        label.font = .millieBody7
        label.textColor = .darkGrey01
        return label
    }()
    
    public let countLabel: UILabel = {
        let label = UILabel()
        label.font = .millieSubHeader8
        label.textColor = .darkGrey02
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
        addSubviews(followLabel,
                    countLabel)
    }
    
    private func setupLayout() {
        followLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.leading.equalTo(followLabel.snp.trailing).offset(3)
        }
    }
}
