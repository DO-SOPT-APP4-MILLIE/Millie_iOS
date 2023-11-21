//
//  BestViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

import SnapKit

final class BestViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        register()

        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    private func target() {
        backButton.addTarget(self,
                             action: #selector(backButtonDidTap),
                             for: .touchUpInside)
    }
    
    private func register() {
        
    }
    
    private func setupStyle() {
        view.backgroundColor = .white
        
        navigationItem.title = "지금! 서점 베스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: heartButton)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.millieHeader3]
    }
    
    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(categoryScrollView,
                                descriptionLabel,
                                dividerView)
        categoryScrollView.addSubview(categoryStackView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(1000)
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
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
