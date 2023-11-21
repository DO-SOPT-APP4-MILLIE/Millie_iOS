//
//  BestViewController.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/21/23.
//

import UIKit

import SnapKit

final class BestViewController: UIViewController {
    
    let booksList: [Book] = [.init(id: 1,
                                   title: "트렌드 코리아 2024",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788959897179.jpg",
                                   author: "김난도, 전미영, 최지혜",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 2,
                                   title: "더 마인드",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788901276571.jpg",
                                   author: "하와이 대저택",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 3,
                                   title: "기적의 자세요정",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791130646664.jpg",
                                   author: "자세요정",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 4,
                                   title: "세이노의 가르침",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791168473690.jpg",
                                   author: "세이노",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 5,
                                   title: "역행자 : 확장판",
                                   imageUrl: "https://contents.kyobobook.co.kr/pdt/4808901272580.jpg",
                                   author: "자청 원작",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 6,
                                   title: "생각이 너무 많은 어른들을 위한 심리학",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791190538602.jpg",
                                   author: "김혜남",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 7,
                                   title: "당신의 인생이 왜 힘들지 않아야 한다고 생각하십니까",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791192625553.jpg",
                                   author: "아르투어 쇼펜하이머 지음/김욱 편역",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 8,
                                   title: "머니 트렌드 2024",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791191891416.jpg",
                                   author: "김도윤, 정태익, 김용섭, 김현준, 전영수, 채상욱, 최재붕, 홍춘욱",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 9,
                                   title: "일론 머스크",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791171170418.jpg",
                                   author: "윌터 아이작슨 지음/안진환 번역",
                                   completionRate: 42,
                                   readingTime: 134),
                             .init(id: 10,
                                   title: "푸바오, 매일매일 행복해",
                                   imageUrl: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791171251704.jpg",
                                   author: "에버랜드 동물원",
                                   completionRate: 42,
                                   readingTime: 134)]
    
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
                                dividerView,
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
