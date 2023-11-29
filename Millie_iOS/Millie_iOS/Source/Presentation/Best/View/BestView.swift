//
//  BestView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/22/23.
//

import UIKit

import SnapKit

final class BestView: UIView {
    
    public var booksList: [BestModel] = []

    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.arrowLeft, for: .normal)
        return button
    }()
    
    public let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.heart, for: .normal)
        return button
    }()
    
    public let scrollView = UIScrollView()
    public let contentView = UIView()
    
    public let categoryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    public let bestCategoryStackView = BestCategoryStackView()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "서점 3사 100위 내, 70권을 밀리에서 만나보세요."
        label.font = .millieBody6
        label.textColor = .darkGrey01
        return label
    }()
    
    public let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey04
        return view
    }()
    
    public let countLabel: UILabel = {
        let label = UILabel()
        label.font = .millieSubHeader2
        label.textColor = .darkGrey03
        return label
    }()
    
    public let feedButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.feed, for: .normal)
        return button
    }()
    
    public let gridButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.grid, for: .normal)
        return button
    }()
    
    public let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorColor = .lightGrey02
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    public let upButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.arrowTop, for: .normal)
        button.backgroundColor = .milWhite
        button.layer.cornerRadius = 22
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.06
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 18
        return button
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
        countLabel.text = "총 \(booksList.count)권"
    }
    
    private func setupHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(categoryScrollView,
                                descriptionLabel,
                                dividerView,
                                countLabel,
                                feedButton,
                                gridButton,
                                tableView,
                                upButton)
        categoryScrollView.addSubview(bestCategoryStackView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        categoryScrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        bestCategoryStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(categoryScrollView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(24)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.equalTo(feedButton.snp.centerY)
            $0.leading.equalToSuperview().inset(22)
        }
        
        feedButton.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(24)
            $0.trailing.equalTo(gridButton.snp.leading)
            $0.size.equalTo(24)
        }
        
        gridButton.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().inset(22)
            $0.size.equalTo(24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(gridButton.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(booksList.count * 128 - 8)
        }
        
        upButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-24)
            $0.size.equalTo(44)
        }
    }
}
