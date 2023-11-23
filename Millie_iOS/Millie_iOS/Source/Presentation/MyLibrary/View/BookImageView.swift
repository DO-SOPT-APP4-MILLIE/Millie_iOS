//
//  BookImageView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class BookImageView: UIView {
    
    public let imageContainerView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.18
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 8
        return view
    }()
    
    public let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        imageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(imageContainerView)
        imageContainerView.addSubview(bookImageView)
    }
    
    private func setupLayout() {
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(60)
            $0.height.equalTo(83)
        }
        
        bookImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
