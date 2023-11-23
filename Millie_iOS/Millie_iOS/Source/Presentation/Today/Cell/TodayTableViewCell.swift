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
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let nowBestView: TodayBestView = {
        let view = TodayBestView()
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let fistView: TodayFistView = {
        let view = TodayFistView()
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let monthlyView: TodayMonthlyView = {
        let view = TodayMonthlyView()
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let originalView: TodayOriginalView = {
        let view = TodayOriginalView()
        view.backgroundColor = .milWhite
        return view
    }()
    
    private let preferenceView: TodayPreferenceView = {
        let view = TodayPreferenceView()
        view.backgroundColor = .milWhite
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
        monthlyView.monthlyCollectionView.delegate = self
        monthlyView.monthlyCollectionView.dataSource = self
        originalView.originalCollectionView.delegate = self
        originalView.originalCollectionView.dataSource = self
        preferenceView.preferenceCollectionView.delegate = self
        preferenceView.preferenceCollectionView.dataSource = self
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
        case monthlyView.monthlyCollectionView:
            return CGSize(width: 140, height: 274)
        case originalView.originalCollectionView:
            return CGSize(width: 290, height: 310)
        case preferenceView.preferenceCollectionView:
            return CGSize(width: 156, height: 249)
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
        case monthlyView.monthlyCollectionView:
            return 13.0
        case originalView.originalCollectionView:
            return 12.0
        case preferenceView.preferenceCollectionView:
            return 18.0
        default:
            return 0.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case preferenceView.preferenceCollectionView:
            return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 24)
        default:
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case nowBestView.bestCollectionView:
            return 3
        case monthlyView.monthlyCollectionView:
            return 2
        case preferenceView.preferenceCollectionView:
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
        case monthlyView.monthlyCollectionView:
            return 10
        case originalView.originalCollectionView:
            return 4
        case preferenceView.preferenceCollectionView:
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
        case monthlyView.monthlyCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayMonthlyCollectionViewCell.identifier, for: indexPath) as? TodayMonthlyCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case originalView.originalCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayOriginalCollectionViewCell.identifier, for: indexPath) as? TodayOriginalCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case preferenceView.preferenceCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayPreferenceCollectionViewCell.identifier, for: indexPath) as? TodayPreferenceCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


