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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let categoryStackView = CategoryStackView()
    
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
        view.addSubviews(scrollView)
        scrollView.addSubview(categoryStackView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(25)
        }
    }
    
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
