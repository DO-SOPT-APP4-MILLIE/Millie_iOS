//
//  MyLibraryShelfCategoryStackView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit
    
final class MyLibraryShelfCategoryStackView: UIStackView {
    
    public let myLibraryList: [MyLibraryModel] = MyLibraryDummyData

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 13.0
    }
    
    private func setupHierarchy() {
        for myLibrary in myLibraryList {
            let shelfCategoryView = MyLibraryShelfCategoryView()
            shelfCategoryView.categoryLabel.text = myLibrary.category
            shelfCategoryView.firstBookImageView.bookImageView.kfSetImage(url: myLibrary.books[0].imageUrl)
            if myLibrary.books.count > 1 {
                shelfCategoryView.secondBookImageView.bookImageView.kfSetImage(url: myLibrary.books[1].imageUrl)
            } else {
                shelfCategoryView.secondBookImageView.removeFromSuperview()
            }
            addArrangedSubview(shelfCategoryView)
        }
    }
}
