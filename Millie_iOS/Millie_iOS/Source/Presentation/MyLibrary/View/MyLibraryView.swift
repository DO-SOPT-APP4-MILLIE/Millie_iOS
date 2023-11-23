//
//  MyLibraryView.swift
//  Millie_iOS
//
//  Created by Hyowon Jeon on 11/23/23.
//

import UIKit

import SnapKit

final class MyLibraryView: UIView {

    public let addButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.add, for: .normal)
        return button
    }()
    
    public let hamburgerButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.hamburger, for: .normal)
        return button
    }()
    
    public let scrollView = UIScrollView()
    public let contentView = UIView()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.profile
        return imageView
    }()
    
    public let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "흐먐냠"
        label.font = .millieHeader3
        label.textColor = .darkGrey03
        return label
    }()
    
    public let libraryLabel: UILabel = {
        let label = UILabel()
        label.text = "의 서재"
        label.font = .millieBody1
        label.textColor = .darkGrey03
        return label
    }()
    
    public let subscribeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = .init(top: 12.0, leading: 16.0, bottom: 12.0, trailing: 16.0)
        configuration.imagePlacement = .leading
        configuration.imagePadding = 8
        
        let button = UIButton()
        button.setButtonAttributedTitle(text: "정기구독하기", font: .millieSubHeader8, color: .darkGrey03)
        button.layer.borderColor = UIColor.darkGrey03.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.configuration = configuration
        return button
    }()
    
    public let followingView = FollowView()
    public let followerView = FollowView()
    
    public let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGrey02
        view.layer.cornerRadius = 1
        return view
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
        followingView.followLabel.text = "팔로잉"
        followingView.countLabel.text = "0"
        followerView.followLabel.text = "팔로잉"
        followerView.countLabel.text = "0"
    }
    
    private func setupHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(profileImageView,
                                nicknameLabel,
                                libraryLabel,
                                subscribeButton,
                                followingView,
                                dividerView,
                                followerView)
    }
    
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(24)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        libraryLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(4)
            $0.leading.equalTo(nicknameLabel.snp.trailing)
        }
        
        subscribeButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(4)
            $0.trailing.equalToSuperview().inset(25)
        }
        
        followingView.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(11)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        dividerView.snp.makeConstraints {
            $0.centerY.equalTo(followingView.snp.centerY)
            $0.leading.equalTo(followingView.snp.trailing).offset(4)
            $0.size.equalTo(2)
        }
        
        followerView.snp.makeConstraints {
            $0.centerY.equalTo(followingView.snp.centerY)
            $0.leading.equalTo(dividerView.snp.trailing).offset(4)
        }
    }
}
