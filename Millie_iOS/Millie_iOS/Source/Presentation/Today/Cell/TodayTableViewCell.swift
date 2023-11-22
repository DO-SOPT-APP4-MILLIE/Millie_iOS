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
    
    public let favoriteView: TodayFavoriteView =  {
        let view = TodayFavoriteView()
        view.backgroundColor = .white
        return view
    }()
    
    private let nowBestView: TodayBestView = {
        let view = TodayBestView()
        view.backgroundColor = .white
        return view
    }()
    
    private let fistView: TodayFistView = {
        let view = TodayFistView()
        view.backgroundColor = .white
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
        
        delegate()
        
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func delegate() {
        favoriteView.favoriteCollectionView.delegate = self
        favoriteView.favoriteCollectionView.dataSource = self
        nowBestView.bestCollectionView.delegate = self
        nowBestView.bestCollectionView.dataSource = self
        fistView.fistCollectionView.delegate = self
        fistView.fistCollectionView.dataSource = self
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(mainView, favoriteView, nowBestView, fistView, monthlyView, originalView, preferenceView)
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
        
        nowBestView.snp.makeConstraints() {
            $0.top.equalTo(favoriteView.snp.bottom).offset(45)
            $0.width.equalToSuperview()
            $0.height.equalTo(352)
        }
        
        fistView.snp.makeConstraints() {
            $0.top.equalTo(nowBestView.snp.bottom).offset(55)
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

extension TodayTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return CGSize(width: 56, height: 81)
        case nowBestView.bestCollectionView:
            return CGSize(width: 221, height: 87)
        case fistView.fistCollectionView:
            return CGSize(width: 331, height: 447)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return 16.0
        case nowBestView.bestCollectionView:
            return 60.0
        case fistView.fistCollectionView:
            return 12.0
        default:
            return 0.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        case nowBestView.bestCollectionView:
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        case fistView.fistCollectionView:
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case nowBestView.bestCollectionView:
            return 3
        default:
            return 1
        }
    }
}

extension TodayTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return 7
        case nowBestView.bestCollectionView:
            return 6
        case fistView.fistCollectionView:
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayFavoriteCollectionViewCell.identifier, for: indexPath) as? TodayFavoriteCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case nowBestView.bestCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayBestCollectionViewCell.identifier, for: indexPath) as? TodayBestCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case fistView.fistCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayFistCollectionViewCell.identifier, for: indexPath) as? TodayFistCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


