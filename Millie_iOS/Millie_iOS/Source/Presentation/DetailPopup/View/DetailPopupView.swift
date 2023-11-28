//
//  DetailPopupView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/25/23.
//

import UIKit

import SnapKit

final class DetailPopupView: UIView {
    
    public let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .milWhite
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 서재에 담기"
        label.font = .millieHeader2
        label.textColor = .darkGrey03
        return label
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "책장을 선택하면 함께 담을 수 있어요"
        label.font = .millieBody5
        label.textColor = .darkGrey01
        return label
    }()
    
    public let addShelfutton: UIButton = {
        let button = UIButton()
        button.setButtonAttributedTitle(text: "+ 책장 만들기", font: .millieBody2, color: .darkGrey03)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGrey03.cgColor
        button.backgroundColor = .milWhite
        return button
    }()
    
    public let myFavoriteView = DetailPopupMyFavoriteView()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.setButtonAttributedTitle(text: "취소", font: .millieBody2, color: .darkGrey03)
        button.backgroundColor = .lightGrey03
        return button
    }()
    
    public let addButton: UIButton = {
        let button = UIButton()
        button.setButtonAttributedTitle(text: "담기", font: .millieBody2, color: .darkGrey03)
        button.backgroundColor = .mainYello
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
        addSubview(containerView)
        containerView.addSubviews(titleLabel,
                                  descriptionLabel,
                                  addShelfutton,
                                  myFavoriteView,
                                  cancelButton,
                                  addButton)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(33)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
        }
        
        addShelfutton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(57)
        }
        
        myFavoriteView.snp.makeConstraints {
            $0.top.equalTo(addShelfutton.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(25)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(myFavoriteView.snp.bottom).offset(56)
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(containerView.snp.centerX)
            $0.height.equalTo(55)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(myFavoriteView.snp.bottom).offset(56)
            $0.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(containerView.snp.centerX)
            $0.height.equalTo(55)
        }
    }
}
