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
