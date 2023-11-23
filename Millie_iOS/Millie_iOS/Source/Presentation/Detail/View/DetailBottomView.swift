//
//  DetailBottomView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailBottomView: UIView {
    
    public let saveButton: UIButton = {
        let button = UIButton()
        let saveIcon = UIImage(named: "detail_ic_save")
        button.setImage(saveIcon, for: .normal)
        button.setTitle("담기", for: .normal)
        button.titleLabel?.font = .millieBody9
        button.setTitleColor(.darkGrey01, for: .normal)
        button.tintColor = .darkGrey01
        return button
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
        
        saveButton.alignTextBelow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubviews(saveButton,
                         readButton)
    }
    
    private func setupLayout() {
        saveButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(22)
            $0.width.equalTo(42)
            $0.height.equalTo(42)
        }
        
        readButton.snp.makeConstraints {
            $0.top.equalTo(saveButton.snp.top)
            $0.trailing.equalToSuperview().offset(-24)
            $0.width.equalTo(285)
            $0.height.equalTo(42)
        }
    }

    
}
