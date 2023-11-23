//
//  DetailBottomView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailBottomView: UIView {
    
    public let saveIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_save")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let saveLabel: UILabel = {
        let label = UILabel()
        label.text = "담기"
        label.textColor = .darkGrey01
        label.font = .millieBody9
        return label
    }()
    
    public let readButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGrey03
        button.setTitle("바로 읽기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .millieBody2
        
        button.layer.cornerRadius = 5
        
        return button
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
        self.addSubviews(saveIconImageView,
                         saveLabel,
                         readButton)
    }
    
    private func setupLayout() {
        saveIconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(22)
            $0.height.equalTo(24)
        }
        
        saveLabel.snp.makeConstraints {
            $0.centerX.equalTo(saveIconImageView.snp.centerX)
            $0.top.equalTo(saveIconImageView.snp.bottom)
        }
        
        readButton.snp.makeConstraints {
            $0.top.equalTo(saveIconImageView.snp.top)
            $0.leading.equalToSuperview().offset(79)
            $0.trailing.equalToSuperview().offset(-24)
            $0.height.equalTo(42)
        }
    }

    
}
