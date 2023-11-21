//
//  BestViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

import SnapKit

final class BestViewController: UIViewController {
    
    private let booksList: [Book] = BestDummyData
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.arrowLeft, for: .normal)
        return button
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.heart, for: .normal)
        return button
    }()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let categoryStackView = CategoryStackView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "서점 3사 100위 내, 70권을 밀리에서 만나보세요."
        label.font = .millieBody6
        label.textColor = .darkGrey01
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey04
        return view
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = .millieSubHeader2
        label.textColor = .darkGrey03
        return label
    }()
    
    private let feedButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.feed, for: .normal)
        return button
    }()
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.grid, for: .normal)
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorColor = .lightGrey02
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private let upButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.arrowTop, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 22
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.06
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 18
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        register()
        delegate()

        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func target() {
        backButton.addTarget(self,
                             action: #selector(backButtonDidTap),
                             for: .touchUpInside)
        
        upButton.addTarget(self,
                             action: #selector(upButtonDidTap),
                             for: .touchUpInside)
    }
    
    private func register() {
        tableView.register(BestTableViewCell.self, forCellReuseIdentifier: BestTableViewCell.identifier)
    }
    
    private func delegate() {
        tableView.dataSource = self
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        
        navigationItem.title = "지금! 서점 베스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: heartButton)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.millieHeader3]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        countLabel.text = "총 \(booksList.count)권"
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(categoryScrollView,
                                descriptionLabel,
                                dividerView,
                                countLabel,
                                feedButton,
                                gridButton,
                                tableView,
                                upButton)
        categoryScrollView.addSubview(categoryStackView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
        
        categoryStackView.snp.makeConstraints {
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
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.size.equalTo(44)
        }
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func upButtonDidTap() {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

extension BestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BestTableViewCell.identifier,
            for: indexPath
        ) as? BestTableViewCell else {return UITableViewCell()}
        
        cell.selectionStyle = .none
        cell.bindData(index: indexPath.row, book: booksList[indexPath.row])
        return cell
    }
}
