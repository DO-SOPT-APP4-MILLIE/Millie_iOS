//
//  TodayView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

import SnapKit

class TodayView: UIView {
    
    let todayTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.register(TodayTableViewCell.self, forCellReuseIdentifier: TodayTableViewCell.identifier)
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
