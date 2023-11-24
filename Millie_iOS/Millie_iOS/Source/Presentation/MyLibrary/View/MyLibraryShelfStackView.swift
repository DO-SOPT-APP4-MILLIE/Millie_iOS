//
//  MyLibraryShelfStackView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit
    
final class MyLibraryShelfStackView: UIStackView {
    
    private let shelfList = ["전체도서", "책장", "독서노트", "통계"]
    
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
        spacing = 22.0
    }
    
    private func setupHierarchy() {
        for shelf in shelfList {
            let shelfView = MyLibraryShelfView()
            shelfView.shelfLabel.text = shelf
            if shelf == "전체도서" {
                shelfView.shelfLabel.font = .millieSubHeader2
                shelfView.selectedView.backgroundColor = .darkGrey03

            } else {
                shelfView.shelfLabel.font = .millieBody3
                shelfView.selectedView.backgroundColor = .clear
            }
            addArrangedSubview(shelfView)
        }
    }
}
