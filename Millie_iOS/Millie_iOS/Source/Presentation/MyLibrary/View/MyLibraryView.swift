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
    
    public let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGrey02
        view.layer.cornerRadius = 1
        return view
    }()
    
    public let recentAudioView = BookmarkView()
    public let favoriteBookView = BookmarkView()
    
    public let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey03
        return view
    }()
    
    public let shelfStackView = ShelfStackView()
    
    public let shelfCategoryStackView = ShelfCategoryStackView()
    
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
        
        recentAudioView.iconImageView.image = Image.audioLine.withRenderingMode(.alwaysTemplate)
        recentAudioView.descriptionLabel.text = "최근 들은 오디오가\n없어요."
        
        favoriteBookView.iconImageView.image = Image.bookmarkLine.withRenderingMode(.alwaysTemplate)
        favoriteBookView.descriptionLabel.text = "나의 인생책을 직접\n설정해보세요."
    }
    
    private func setupHierarchy() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(profileImageView,
                                nicknameLabel,
                                libraryLabel,
                                subscribeButton,
                                followingView,
                                separatorView,
                                followerView,
                                recentAudioView,
                                favoriteBookView,
                                dividerView,
                                shelfStackView,
                                shelfCategoryStackView)
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
        
        separatorView.snp.makeConstraints {
            $0.centerY.equalTo(followingView.snp.centerY)
            $0.leading.equalTo(followingView.snp.trailing).offset(4)
            $0.size.equalTo(2)
        }
        
        followerView.snp.makeConstraints {
            $0.centerY.equalTo(followingView.snp.centerY)
            $0.leading.equalTo(separatorView.snp.trailing).offset(4)
        }
        
        recentAudioView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(24)
            $0.width.equalTo(125)
            $0.height.equalTo(117)
        }
        
        favoriteBookView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(32)
            $0.leading.equalTo(recentAudioView.snp.trailing).offset(10)
            $0.width.equalTo(125)
            $0.height.equalTo(117)
        }

        dividerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.bottom.equalTo(shelfStackView.snp.bottom)
            $0.height.equalTo(1)
        }
        
        shelfStackView.snp.makeConstraints {
            $0.top.equalTo(recentAudioView.snp.bottom).offset(56)
            $0.left.equalToSuperview().offset(24)
        }
        
        shelfCategoryStackView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(58)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
}
