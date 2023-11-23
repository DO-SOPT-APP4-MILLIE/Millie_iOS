//
//  DetailDividerView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/23/23.
//

import UIKit

class DetailDividerView: UIView {
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
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
        self.addSubview(divider)
    }

    private func setupLayout() {
        divider.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
}
