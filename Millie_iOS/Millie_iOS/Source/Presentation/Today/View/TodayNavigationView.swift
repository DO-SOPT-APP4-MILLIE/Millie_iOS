//
//  TodayNavigationView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/30/23.
//

import UIKit

class TodayNavigationView: UIView {

    private let naviView : UIView = {
        let view = UIView()
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let logoButton : UIButton = {
        let button = UIButton()
        button.setImage(Image.todayLogo, for: .normal)
        return button
    }()
    
    private let bellButton : UIButton = {
        let button = UIButton()
        button.setImage(Image.todayBell, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        self.backgroundColor = .milWhite
        self.addSubview(naviView)
        naviView.addSubviews(logoButton, bellButton)
    }
        
    private func setupLayout() {
        naviView.snp.makeConstraints() {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        logoButton.snp.makeConstraints() {
            $0.leading.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(12)
            $0.width.equalTo(48)
            $0.height.equalTo(21)
        }
        
        bellButton.snp.makeConstraints() {
            $0.trailing.equalToSuperview().inset(11)
            $0.bottom.equalToSuperview().inset(8)
            $0.width.equalTo(29)
            $0.height.equalTo(32)
        }
    }
}
