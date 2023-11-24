//
//  MyLibraryShelfCategoryView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class MyLibraryShelfCategoryView: UIView {
        
    public let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .milWhite
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    public let firstBookImageView = MyLibraryBookView()
    public let secondBookImageView = MyLibraryBookView()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .millieSubHeader7
        label.textColor = .darkGrey03
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 20
    }
    
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(secondBookImageView,
                                firstBookImageView,
                                categoryLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        firstBookImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(12)
        }
        
        secondBookImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(55)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(firstBookImageView.snp.bottom).offset(14)
            $0.bottom.leading.equalToSuperview().inset(12)
        }
    }
}
