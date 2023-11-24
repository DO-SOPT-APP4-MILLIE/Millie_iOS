//
//  DetailBookDescriptionStackView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailBookDescriptionStackView: UIView {
    
    public let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 2
        
        return stackView
    }()
    
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 10)
        return label
    }()
    
    public let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        
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
        self.addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubviews(iconImageView, 
                                                 titleLabel,
                                                 countLabel)
    }
    
    private func setupLayout() {
        descriptionStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
}
