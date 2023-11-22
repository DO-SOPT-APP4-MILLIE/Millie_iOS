//
//  TodayTableViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    
    static let identifier: String = "TodayTableViewCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let favoriteView: UIView =  {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private let bestView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let fistView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let monthlyView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let originalView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private let preferenceView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(mainView, favoriteView, bestView, fistView, monthlyView, originalView, preferenceView)
    }
    
    private func setupLayout() {
        mainView.snp.makeConstraints() {
            $0.top.equalTo(safeAreaInsets.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(super.snp.width)
        }
        
        favoriteView.snp.makeConstraints() {
            $0.top.equalTo(mainView.snp.bottom).offset(32)
            $0.width.equalToSuperview()
            $0.height.equalTo(135)
        }
        
        bestView.snp.makeConstraints() {
            $0.top.equalTo(favoriteView.snp.bottom).offset(45)
            $0.width.equalToSuperview()
            $0.height.equalTo(352)
        }
        
        fistView.snp.makeConstraints() {
            $0.top.equalTo(bestView.snp.bottom).offset(55)
            $0.width.equalToSuperview()
            $0.height.equalTo(501)
        }
        
        monthlyView.snp.makeConstraints() {
            $0.top.equalTo(fistView.snp.bottom).offset(55)
            $0.width.equalToSuperview()
            $0.height.equalTo(637)
        }
        
        originalView.snp.makeConstraints() {
            $0.top.equalTo(monthlyView.snp.bottom).offset(56)
            $0.width.equalToSuperview()
            $0.height.equalTo(446)
        }
        
        preferenceView.snp.makeConstraints() {
            $0.top.equalTo(originalView.snp.bottom).offset(40)
            $0.width.equalToSuperview()
            $0.height.equalTo(889)
        }
    }
}
