//
//  TodayView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

import SnapKit

final class TodayView: UIView {
    
    public let todayTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let tabBarView = TabBarView()
    private let naviView = TodayNavigationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubviews(naviView, todayTableView, tabBarView)
    }
    
    private func setupLayout() {
        naviView.snp.makeConstraints() {
            $0.top.width.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        tabBarView.snp.makeConstraints() {
            $0.bottom.width.equalToSuperview()
            $0.height.equalTo(92)
        }
        
        todayTableView.snp.makeConstraints() {
            $0.top.equalTo(naviView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(tabBarView.snp.top)
        }
    }
}
