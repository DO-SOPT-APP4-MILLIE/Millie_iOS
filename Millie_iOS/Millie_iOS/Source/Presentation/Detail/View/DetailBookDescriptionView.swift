//
//  DetailBookDescriptionView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailBookDescriptionView: UIView {
    
    public let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_img_book")
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1).cgColor
        
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 4, height: 8)
        
        return imageView
    }()
    
    public let bookTitle: UILabel = {
        let label = UILabel()
        label.text = "트렌드 코리아 2024"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 20)
        
        return label
    }()
    
    public let bookAuthors: UILabel = {
        let label = UILabel()
        label.text = "김난도, 전미영, 최지혜, 이수진, 권정윤, 한다혜, 이준영, 이향은,…"
        label.textColor = .lightGrey07
        label.font = .spoqaHanSanNeo(.regular, size: 12)
        
        return label
    }()
    
    public let bookInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    public let bookInfoDividerView = UIView()
    
    public let archivedStackView = DetailBookDescriptionStackView()
    public let postStackView = DetailBookDescriptionStackView()
    public let reviewStackView = DetailBookDescriptionStackView()
    
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
        self.addSubviews(bookImageView,
                         bookTitle,
                         bookAuthors,
                         bookInfoStackView,
                         bookInfoDividerView,
                         divider)
        bookInfoStackView.addArrangedSubviews(archivedStackView,
                                              postStackView,
                                              reviewStackView)
    }
    
    private func setupLayout() {
        bookImageView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(220)
        }
        
        bookTitle.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        bookAuthors.snp.makeConstraints {
            $0.top.equalTo(bookTitle.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        bookInfoStackView.snp.makeConstraints {
            $0.top.equalTo(bookAuthors.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
        
        bookInfoDividerView.snp.makeConstraints {
            $0.top.equalTo(bookAuthors.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(127)
            $0.height.equalTo(40)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(bookInfoStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
}
