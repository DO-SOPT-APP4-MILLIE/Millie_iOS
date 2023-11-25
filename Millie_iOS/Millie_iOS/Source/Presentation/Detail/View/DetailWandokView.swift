//
//  DetailWandokView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailWandokView: UIView {
    
    public let bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "국내 최고 트렌드 전망서\n청룡의 해, 2024년을 분석하다"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    public let wandokImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_img_wandok_graph")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let wandokPointIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_shelf_ic_wandok_small")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let wandokAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "히든"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        return label
    }()
    
    public let wandokDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey07
        return view
    }()
    
    public let wandokTextLabel: UILabel = {
        let label = UILabel()
        label.text = "밀리 회원들의 발견을 기다리고 있는 책"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 14)
        return label
    }()
    
    private let divider = DetailDividerView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubviews(bookDescriptionLabel,
                         wandokImageView,
                         wandokPointIconImageView,
                         wandokAreaLabel,
                         wandokDivider,
                         wandokTextLabel,
                         divider)
    }
    
    private func setupLayout() {
        bookDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(24)
        }
        
        wandokImageView.snp.makeConstraints {
            $0.top.equalTo(bookDescriptionLabel.snp.bottom).offset(31)
            $0.width.equalToSuperview()
        }
        
        wandokPointIconImageView.snp.makeConstraints {
            $0.top.equalTo(wandokImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(50)
            $0.width.equalTo(16)
        }
        
        wandokAreaLabel.snp.makeConstraints {
            $0.centerY.equalTo(wandokPointIconImageView.snp.centerY)
            $0.leading.equalTo(wandokPointIconImageView.snp.trailing).offset(8)
        }
        
        wandokDivider.snp.makeConstraints {
            $0.centerY.equalTo(wandokPointIconImageView.snp.centerY)
            $0.leading.equalTo(wandokAreaLabel.snp.trailing).offset(5)
            $0.width.equalTo(1)
            $0.height.equalTo(11)
        }
        
        wandokTextLabel.snp.makeConstraints {
            $0.centerY.equalTo(wandokPointIconImageView.snp.centerY)
            $0.leading.equalTo(wandokDivider.snp.trailing).offset(8)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(wandokTextLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
            $0.bottom.equalToSuperview()
        }
    }

}
