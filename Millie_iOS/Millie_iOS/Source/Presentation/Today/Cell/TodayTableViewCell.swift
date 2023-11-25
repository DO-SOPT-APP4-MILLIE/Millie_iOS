//
//  TodayTableViewCell.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/22/23.
//

import UIKit

final class TodayTableViewCell: UITableViewCell {
    
    static let identifier: String = "TodayTableViewCell"
    
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
        originalView.originalTagCollectionView.delegate = self
        originalView.originalTagCollectionView.dataSource = self
        preferenceView.preferenceCollectionView.delegate = self
        preferenceView.preferenceCollectionView.dataSource = self
        preferenceView.preferenceTagCollectionView.delegate = self
        preferenceView.preferenceTagCollectionView.dataSource = self
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(favoriteView, nowBestView, fistView, monthlyView, originalView, preferenceView)
    }
    
    private func setupLayout() {
        favoriteView.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(32.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(135.adjusted)
        }
        
        nowBestView.snp.makeConstraints() {
            $0.top.equalTo(favoriteView.snp.bottom).offset(45.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(352.adjusted)
        }
        
        fistView.snp.makeConstraints() {
            $0.top.equalTo(nowBestView.snp.bottom).offset(55.adjusted)
            $0.width.equalToSuperview()
            $0.height.equalTo(501.adjusted)
        }
        
        monthlyView.snp.makeConstraints() {
            $0.top.equalTo(fistView.snp.bottom).offset(55)
            $0.width.equalToSuperview()
            $0.height.equalTo(637.adjusted)
        }
        
        originalView.snp.makeConstraints() {
            $0.top.equalTo(monthlyView.snp.bottom).offset(56)
            $0.width.equalToSuperview()
            $0.height.equalTo(456.adjusted)
        }
        
        preferenceView.snp.makeConstraints() {
            $0.top.equalTo(originalView.snp.bottom).offset(40+10)
            $0.width.equalToSuperview()
            $0.height.equalTo(889.adjusted)
        }
    }
}

extension TodayTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return CGSize(width: 56.adjusted, height: 81.adjusted)
        case nowBestView.bestCollectionView:
            return CGSize(width: 221.adjusted, height: 87.adjusted)
        case fistView.fistCollectionView:
            return CGSize(width: 331.adjusted, height: 447.adjusted)
        case monthlyView.monthlyCollectionView:
            return CGSize(width: 140.adjusted, height: 274.adjusted)
        case originalView.originalCollectionView:
            return CGSize(width: 300.adjusted, height: 330.adjusted)
        case originalView.originalTagCollectionView:
            let label: UILabel = UILabel()
            label.text = TodayOriginalTagDummyData[indexPath.row]
            return CGSize(width: Int(label.intrinsicContentSize.width) + 24 , height: 31)
        case preferenceView.preferenceCollectionView:
            return CGSize(width: 156.adjusted, height: 249.adjusted)
            case preferenceView.preferenceTagCollectionView:
            let label: UILabel = UILabel()
            label.text = TodayPreferenceTagDummyData[indexPath.row]
            return CGSize(width: Int(label.intrinsicContentSize.width) + 24 , height: 31)
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case favoriteView.favoriteCollectionView:
            return 16.0.adjusted
        case nowBestView.bestCollectionView:
            return 60.0.adjusted
        case fistView.fistCollectionView:
            return 12.0.adjusted
        case monthlyView.monthlyCollectionView:
            return 13.0.adjusted
        case originalView.originalCollectionView:
            return 12.0.adjusted
        case originalView.originalTagCollectionView:
            return 10.0.adjusted
        case preferenceView.preferenceCollectionView:
            return 18.0.adjusted
        case preferenceView.preferenceTagCollectionView:
            return 10.0.adjusted
        default:
            return 0.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case preferenceView.preferenceCollectionView:
            return UIEdgeInsets(top: 0, left: 25.adjusted, bottom: 0, right: 24.adjusted)
        default:
            return UIEdgeInsets(top: 0, left: 24.adjusted, bottom: 0, right: 24.adjusted)
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
        case originalView.originalTagCollectionView:
            return TodayOriginalTagDummyData.count
        case preferenceView.preferenceCollectionView:
            return 6
        case preferenceView.preferenceTagCollectionView:
            return TodayPreferenceTagDummyData.count
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
        case originalView.originalTagCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayOriginalTagCollectionViewCell.identifier, for: indexPath) as? TodayOriginalTagCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(text: TodayOriginalTagDummyData[indexPath.row])
            return cell
        case preferenceView.preferenceCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayPreferenceCollectionViewCell.identifier, for: indexPath) as? TodayPreferenceCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case preferenceView.preferenceTagCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayPreferenceTagCollectionViewCell.identifier, for: indexPath) as? TodayPreferenceTagCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(text: TodayPreferenceTagDummyData[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


