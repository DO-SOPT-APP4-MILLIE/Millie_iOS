//
//  BestTableViewCell.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

import SnapKit

final class BestTableViewCell: UITableViewCell {

    static let identifier: String = "BestTableViewCell"
    
    private let rankingView = UIView()
    
    private let rankingLabel: UILabel = {
        let label = UILabel()
        label.font = .millieHeader6
        label.textColor = .darkGrey03
        return label
    }()
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.14
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5
        return view
    }()
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMaxYCorner, .layerMaxXMinYCorner)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .millieSubHeader6
        label.textColor = .darkGrey03
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .millieBody6
        label.textColor = .darkGrey01
        return label
    }()
    
    private let detailView = UIView()
    
    private let wandokImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.wandok.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGrey01
        return imageView
    }()
    
    private let completionRateLabel: UILabel = {
        let label = UILabel()
        label.font = .millieBody6
        label.textColor = .darkGrey01
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGrey01
        return view
    }()
    
    private let readingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .millieBody6
        label.textColor = .darkGrey01
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubviews(rankingView,
                                imageContainerView,
                                titleLabel,
                                authorLabel,
                                detailView)
        rankingView.addSubviews(rankingLabel)
        imageContainerView.addSubview(bookImageView)
        detailView.addSubviews(wandokImageView,
                               completionRateLabel,
                               dividerView,
                               readingTimeLabel)
    }
    
    private func setupLayout() {
        rankingView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(38)
            $0.height.equalTo(51)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
        }
        
        imageContainerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(rankingView.snp.trailing).offset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(100).priority(.high)
        }
        
        bookImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageContainerView.snp.top).offset(18)
            $0.leading.equalTo(imageContainerView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().inset(58)
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(imageContainerView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().inset(58)
        }

        detailView.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(4)
            $0.leading.equalTo(imageContainerView.snp.trailing).offset(22)
            $0.width.equalTo(86)
            $0.height.equalTo(20)
        }
        
        wandokImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        completionRateLabel.snp.makeConstraints {
            $0.leading.equalTo(wandokImageView.snp.trailing).offset(2)
            $0.centerY.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints {
            $0.leading.equalTo(completionRateLabel.snp.trailing).offset(5)
            $0.top.bottom.equalToSuperview().inset(2)
            $0.width.equalTo(1)
        }
        
        readingTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(dividerView.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bindData(index: Int, book: Book) {
        rankingLabel.text = String(index + 1)
        bookImageView.kfSetImage(url: book.imageUrl)
        titleLabel.text = book.title
        authorLabel.text = book.author
        completionRateLabel.text = "\(book.completionRate)%"
        readingTimeLabel.text = "\(book.readingTime)분"
    }
}
