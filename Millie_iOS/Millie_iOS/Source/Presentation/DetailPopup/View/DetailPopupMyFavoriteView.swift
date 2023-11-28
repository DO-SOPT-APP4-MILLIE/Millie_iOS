//
//  DetailPopupMyFavoriteView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/27/23.
//

import UIKit

import SnapKit

final class DetailPopupMyFavoriteView: UIView {
    
    public var isSelected: Bool = false
    
    public let myFavoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "☆ My Favorite"
        label.font = .millieBody2
        label.textColor = .darkGrey03
        return label
    }()
        
    public let selectedView: UIView = {
        let view = UIView()
        view.backgroundColor = .milWhite
        view.clipsToBounds = true
        view.layer.cornerRadius = 9
        view.layer.borderWidth = 1.8
        view.layer.borderColor = UIColor.lightGrey03.cgColor
        return view
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
        addSubviews(myFavoriteLabel,
                    selectedView)
    }
    
    private func setupLayout() {
        myFavoriteLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        selectedView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(myFavoriteLabel.snp.centerY)
            $0.size.equalTo(18)
        }
    }
}
