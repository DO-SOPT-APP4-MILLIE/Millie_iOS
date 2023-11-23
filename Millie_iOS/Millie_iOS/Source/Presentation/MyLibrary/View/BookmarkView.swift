//
//  BookmarkView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class BookmarkView: UIView {
    
    public let containerView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.08
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 20
        return view
    }()
    
    public let contentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGrey06
        return imageView
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .millieBody7
        label.textColor = .lightGrey07
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
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
        addSubview(containerView)
        containerView.addSubview(contentView)
        contentView.addSubviews(iconImageView,
                                descriptionLabel)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(25)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(25)
        }
    }
}
