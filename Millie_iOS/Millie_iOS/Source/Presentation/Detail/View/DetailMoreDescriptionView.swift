//
//  DetailMoreDescriptionView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

class DetailMoreDescriptionView: UIView {
    
    public let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "부제"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()

    public let subContentLabel: UILabel = {
        let label = UILabel()
        label.text = "2024 대한민국 소비트렌드 전망"
        label.textColor = .darkGrey02
        label.font = .millieBody4
        return label
    }()
    
    private let divider1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    public let introduceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "책 소개"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let introduceSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "DRAGON EYES\n청룡을 타고 비상하는 2024를 기원하며!"
        label.textColor = .darkGrey02
        label.font = .millieSubHeader4
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    public let introduceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "모든 일은 서서히 준비되고 있다가 갑작스럽게 나타난다.\n챗GPT가 그랬다. 인공지능 기술과 이야기가 수도 없이 …"
        label.textColor = .darkGrey02
        label.font = .millieBody4
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private let divider2 = DetailDividerView()
    
    public let bookOrderLabel: UILabel = {
        let label = UILabel()
        label.text = "목차"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.text = "저자 소개"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let bookCompanyLabel: UILabel = {
        let label = UILabel()
        label.text = "출판사 서평"
        label.textColor = .darkGrey03
        label.font = .spoqaHanSanNeo(.bold, size: 16)
        return label
    }()
    
    public let arrowImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_arrow_down_line")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let arrowImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_arrow_down_line")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public let arrowImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_ic_arrow_down_line")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let divider3: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    private let divider4: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    private let divider5: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    private let divider6: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGrey02
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        self.addSubviews(subTitleLabel,
                         subContentLabel,
                         divider1,
                         introduceTitleLabel,
                         introduceSubTitleLabel,
                         introduceDescriptionLabel,
                         divider2,
                         bookOrderLabel,
                         bookAuthorLabel,
                         bookCompanyLabel,
                         arrowImageView1,
                         arrowImageView2,
                         arrowImageView3,
                         divider3,
                         divider4,
                         divider5,
                         divider6)
    }
    
    private func setupLayout() {
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(24)
        }
        
        subContentLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(38)
            $0.leading.equalTo(subTitleLabel.snp.leading)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(subContentLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        introduceTitleLabel.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(28)
            $0.leading.equalTo(subContentLabel.snp.leading)
        }
        
        introduceSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(introduceTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(introduceTitleLabel.snp.leading)
        }
        
        introduceDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(introduceSubTitleLabel.snp.bottom).offset(13)
            $0.leading.equalTo(introduceTitleLabel.snp.leading)
        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(introduceDescriptionLabel.snp.bottom).offset(55)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
        }
        
        bookOrderLabel.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(21)
            $0.leading.equalTo(introduceTitleLabel.snp.leading)
        }
        
        arrowImageView1.snp.makeConstraints {
            $0.top.equalTo(bookOrderLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        divider3.snp.makeConstraints {
            $0.top.equalTo(bookOrderLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bookAuthorLabel.snp.makeConstraints {
            $0.top.equalTo(divider3.snp.bottom).offset(21)
            $0.leading.equalTo(introduceTitleLabel.snp.leading)
        }
        
        arrowImageView2.snp.makeConstraints {
            $0.top.equalTo(bookAuthorLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        divider4.snp.makeConstraints {
            $0.top.equalTo(bookAuthorLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bookCompanyLabel.snp.makeConstraints {
            $0.top.equalTo(divider4.snp.bottom).offset(21)
            $0.leading.equalTo(introduceTitleLabel.snp.leading)
        }
        
        arrowImageView3.snp.makeConstraints {
            $0.top.equalTo(bookCompanyLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-24)
        }
        
        divider5.snp.makeConstraints {
            $0.top.equalTo(bookCompanyLabel.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        divider6.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(divider5.snp.bottom)
            $0.height.equalTo(124)
        }
    }
}
