//
//  DetailToastMessageView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/28/23.
//

import UIKit

import SnapKit

class DetailToastMessageView: UIView {
    
    private let toastLabel: UILabel = {
        let label = UILabel()
        label.text = "My Favorite 책장에 담았습니다."
        label.font = .millieSubHeader7
        label.textColor = .milWhite
        return label
    }()
    
    public let goToMyLibraryButton: UIButton = {
        let button = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.subYello,
            .font: UIFont.millieSubHeader8
        ]
        let attributedString = NSAttributedString(string: "내 서재 바로가기", attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)

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
        self.addSubviews(toastLabel, goToMyLibraryButton)
    }
    
    private func setupLayout() {
        toastLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(32)
        }
        
        goToMyLibraryButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(28)
        }
    }
}
