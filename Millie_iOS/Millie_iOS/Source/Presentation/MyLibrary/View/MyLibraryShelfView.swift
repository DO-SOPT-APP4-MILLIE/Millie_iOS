//
//  MyLibraryShelfView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class MyLibraryShelfView: UIView {
    
    public let shelfLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGrey03
        return label
    }()
    
    public let selectedView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubviews(shelfLabel,
                    selectedView)
    }
    
    private func setupLayout() {
        shelfLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(selectedView.snp.top).offset(-12)
        }
        
        selectedView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
}
