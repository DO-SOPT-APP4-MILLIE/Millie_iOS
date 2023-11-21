//
//  CategoryStackView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

import SnapKit

final class CategoryStackView: UIStackView {

    private let categoryList = ["종합", "트렌드", "라이프", "힐링", "지적교양", "소설"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        axis = .horizontal
        distribution = .fillProportionally
        spacing = 12.0
    }
    
    private func setupHierarchy() {
        for category in categoryList {
            let categoryView = CategoryView()
            categoryView.categoryLabel.text = category
            if category == "종합" {
                categoryView.backgroundColor = .darkGrey03
                categoryView.categoryLabel.font = UIFont.millieSubHeader6
                categoryView.categoryLabel.textColor = .white
            } else {
                categoryView.backgroundColor = .white
                categoryView.layer.borderColor = UIColor.lightGrey02.cgColor
                categoryView.layer.borderWidth = 1
                categoryView.categoryLabel.font = UIFont.millieBody4
                categoryView.categoryLabel.textColor = .darkGrey01
            }
            addArrangedSubview(categoryView)
        }
    }
}
