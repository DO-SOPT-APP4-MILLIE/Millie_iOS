//
//  DetailViewController.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/20/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = UIView()
    
    private let electricBookButton: UIButton = {
        let button = UIButton()
        let electricIcon = UIImage(named: "ic_book_open")
        button.backgroundColor = .white
        button.setImage(electricIcon, for: .normal)
        button.setTitle("전자책", for: .normal)
        button.titleLabel?.font = .spoqaHanSanNeo(.bold, size: 14)
        button.setTitleColor(.darkGrey03, for: .normal)
        button.tintColor = .darkGrey03
        
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.layer.shadowRadius = 12
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    private let audioBookButton: UIButton = {
        let button = UIButton()
        let electricIcon = UIImage(named: "ic_audio_fill_detail")
        button.backgroundColor = .lightGrey02
        button.setImage(electricIcon, for: .normal)
        button.setTitle("오디오북", for: .normal)
        button.titleLabel?.font = .spoqaHanSanNeo(.regular, size: 14)
        button.setTitleColor(.lightGrey07, for: .normal)
        button.tintColor = .lightGrey07
        
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let bookImageView: UIImageView = {
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
    
    private let bookTitle: UILabel = {
        let label = UILabel()
        label.text = "트렌드 코리아 2024"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 20)
        
        return label
    }()
    
    private let bookAuthors: UILabel = {
        let label = UILabel()
        label.text = "김난도, 전미영, 최지혜, 이수진, 권정윤, 한다혜, 이준영, 이향은,…"
        label.textColor = .lightGrey07
        label.font = .spoqaHanSanNeo(.regular, size: 12)
        
        return label
    }()
    
    private let bookInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 60
        
        return stackView
    }()
    
    private let bookInfoDividerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let archivedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 2
        
        return stackView
    }()
    
    private let postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 2
        
        return stackView
    }()
    
    private let reviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 2
        
        return stackView
    }()
    
    private let archivedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_profile")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let archivedLabel: UILabel = {
        let label = UILabel()
        label.text = "이 책이 담긴 서재"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 10)
        return label
    }()
    
    private let archivedCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2.6만 개+"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        
        return label
    }()
    
    private let postIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_post_line")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.text = "포스트"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 10)
        return label
    }()
    
    private let postCountLabel: UILabel = {
        let label = UILabel()
        label.text = "4개"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        
        return label
    }()
    
    private let reviewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_post_line")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "한 줄 리뷰"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 10)
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.text = "29개"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        
        return label
    }()
    
    private let divider1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    private let bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "국내 최고 트렌드 전망서\n청룡의 해, 2024년을 분석하다"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let wandokImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_img_wandok_graph")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let wandokPointIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shelf_ic_wandok_small")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let wandokAreaLabel: UILabel = {
        let label = UILabel()
        label.text = "히든"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.bold, size: 14)
        return label
    }()
    
    private let wandokDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey07
        return view
    }()
    
    private let wandokTextLabel: UILabel = {
        let label = UILabel()
        label.text = "밀리 회원들의 발견을 기다리고 있는 책"
        label.textColor = .darkGrey01
        label.font = .spoqaHanSanNeo(.regular, size: 14)
        return label
    }()
    
    private let divider2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    private let popularTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "성별·연령별 인기 분포"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    private let popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_popular_gragh")
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.06).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return imageView
    }()
    
    private let popularDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "이 책이 속한 경제경영 분야\n역시 20대 여성이 가장 즐겨보고 있어요."
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.backgroundColor = .lightGrey02
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigtion()
        setupLayout()
    }
    
    private func setupNavigtion() {
        let leftBackButton = UIBarButtonItem(image: UIImage(named: "ic_arrow_left_line"), style: .plain, target: self, action: #selector(leftBackButtonTap))
        self.navigationItem.leftBarButtonItem = leftBackButton
        
        let rightStarButton = UIBarButtonItem(image: UIImage(named: "ic_star_slim_line"), style: .plain, target: self, action: #selector(rightStarButtonTap))
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(named: "ic_menu_kebab"), style: .plain, target: self, action: #selector(rightSettingButtonTap))
        
        self.navigationItem.rightBarButtonItems = [rightSettingButton, rightStarButton]
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view.snp.width)
            $0.bottom.equalTo(view.snp.bottom)
//            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        contentView.addSubviews(electricBookButton, audioBookButton)
        
        electricBookButton.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(13)
            $0.trailing.equalTo(audioBookButton.snp.leading).offset(-8)
            $0.width.equalTo(84)
            $0.height.equalTo(36)
        }
        
        audioBookButton.snp.makeConstraints {
            $0.top.equalTo(electricBookButton.snp.top)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.width.equalTo(97)
            $0.height.equalTo(36)
        }
        
        contentView.addSubviews(bookImageView, bookTitle, bookAuthors)
        
        bookImageView.snp.makeConstraints {
            $0.top.equalTo(electricBookButton.snp.bottom).offset(26)
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
        
        contentView.addSubviews(bookInfoStackView, bookInfoDividerView)
        bookInfoStackView.addArrangedSubviews(archivedStackView, postStackView, reviewStackView)
        
        bookInfoStackView.snp.makeConstraints {
            $0.top.equalTo(bookAuthors.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(65)
        }
        
        bookInfoDividerView.snp.makeConstraints {
            $0.top.equalTo(bookAuthors.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(127)
            $0.height.equalTo(40)
        }
        
        archivedStackView.addArrangedSubviews(archivedIcon, archivedLabel, archivedCountLabel)
        
        postStackView.addArrangedSubviews(postIcon, postLabel, postCountLabel)
        
        reviewStackView.addArrangedSubviews(reviewIcon, reviewLabel, reviewCountLabel)
        
        contentView.addSubview(divider1)
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(bookInfoStackView.snp.bottom).offset(26)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(11)
        }
        
        contentView.addSubviews(bookDescriptionLabel, wandokImageView, wandokPointIconImageView, wandokAreaLabel, wandokDivider, wandokTextLabel)
        
        bookDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(22)
            $0.leading.equalTo(contentView.snp.leading).offset(24)
        }
        
        wandokImageView.snp.makeConstraints {
            $0.top.equalTo(bookDescriptionLabel.snp.bottom).offset(31)
            $0.width.equalTo(contentView.snp.width)
        }
        
        wandokPointIconImageView.snp.makeConstraints {
            $0.top.equalTo(wandokImageView.snp.bottom).offset(2)
            $0.leading.equalTo(contentView.snp.leading).offset(50)
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
        
        contentView.addSubviews(divider2, popularTitleLabel, popularImageView, popularDescriptionLabel)
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(wandokTextLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(11)
        }
        
        popularTitleLabel.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(22)
            $0.leading.equalTo(contentView.snp.leading).offset(24)
        }
        
        popularImageView.snp.makeConstraints {
            $0.top.equalTo(popularTitleLabel.snp.bottom).offset(12)
//            $0.width.equalTo(contentView.snp.width)
            $0.leading.trailing.equalTo(contentView)
        }
        
        popularDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(popularImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(contentView).inset(24)
            $0.height.equalTo(74)
        }
        
    }
    
    @objc
    private func leftBackButtonTap() {
        print("네비게이션 POP")
    }
    
    @objc
    private func rightStarButtonTap() {
        
    }
    
    @objc
    private func rightSettingButtonTap() {
        
    }
}
