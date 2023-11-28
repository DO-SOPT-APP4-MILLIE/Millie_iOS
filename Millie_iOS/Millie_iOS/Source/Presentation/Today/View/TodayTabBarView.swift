//
//  TodayTabBarVIew.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/27/23.
//

import UIKit

import SnapKit

class TodayTabBarView: UIView {
    
    private var feedButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.tabFeed, for: .normal)
        button.tintColor = .darkGrey01
        return button
    }()
    
    private var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.tabSearch, for: .normal)
        button.tintColor = .darkGrey01
        return button
    }()
    
    private var myLibararyButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.tabMylibrary, for: .normal)
        button.tintColor = .darkGrey01
        return button
    }()
    
    private var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.tabSetting, for: .normal)
        button.tintColor = .darkGrey01
        return button
    }()
    
    private var bookButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.tabBook, for: .normal)
        button.addTarget(self, action: #selector(bookButtonTap), for: .touchUpInside)
        return button
    }()
    
    private var booKStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.isHidden = true
        return stackView
    }()
    
    private var storyButton : UIButton = {
        let button = UIButton()
        button.setImage(Image.tabStory, for: .normal)
        return button
    }()
    
    private var roadButton : UIButton = {
        let button = UIButton()
        button.setImage(Image.tabRoad, for: .normal)
        return button
    }()
    
    private var audioButton : UIButton = {
        let button = UIButton()
        button.setImage(Image.tabAudio, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.backgroundColor = .milWhite
        booKStackView.addArrangedSubviews(storyButton, roadButton, audioButton)
        self.addSubviews(feedButton, searchButton, myLibararyButton, settingButton, booKStackView, bookButton)
    }
    
    private func setupLayout() {
        feedButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.size.equalTo(46)
        }
        
        searchButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(feedButton.snp.trailing).offset(28)
            $0.size.equalTo(46)
        }
        
        myLibararyButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalTo(settingButton.snp.leading).offset(-30)
            $0.size.equalTo(46)
        }
        
        settingButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(15)
            $0.size.equalTo(46)
        }
        
        bookButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(61)
        }
        
        booKStackView.snp.makeConstraints() {
            $0.bottom.equalTo(bookButton.snp.top)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(114)
            $0.height.equalTo(160)
        }
    }
    
    @objc
    private func bookButtonTap() {
        booKStackView.isHidden.toggle()
    }
}
