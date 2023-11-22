//
//  UICollectionView+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

extension UICollectionView {
    
    static func todayCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }
}
