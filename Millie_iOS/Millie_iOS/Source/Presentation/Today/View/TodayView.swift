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
        let view = UITableView()
        view.backgroundColor = .milWhite
        return view
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
        self.addSubview(todayTableView)
    }
    
    private func setupLayout() {
        todayTableView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
}