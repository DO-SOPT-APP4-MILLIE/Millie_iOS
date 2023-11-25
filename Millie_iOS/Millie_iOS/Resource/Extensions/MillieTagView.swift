//
//  MillieTagView.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/26/23.
//

import UIKit

import SnapKit

class MillieTagView: UIView {
    
    private let emptyWidth = 14
    private let emptyHeight = 31
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.layer.backgroundColor = UIColor.milWhite.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.lightGrey02.cgColor
        return stackView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = .millieBody5
        label.textColor = .darkGrey01
        label.textAlignment = .center
        label.frame.size = label.intrinsicContentSize
        return label
    }()
    
    let emptylabel1 = UILabel()
    let emptylabel2 = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.clipsToBounds = true
        stackView.layer.cornerRadius = CGFloat(emptyHeight/2)
    }
    
    private func setupHierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(emptylabel1)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(emptylabel2)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
        emptylabel1.snp.makeConstraints {
            $0.width.equalTo(emptyWidth)
            $0.height.equalTo(emptyHeight)
        }
        
        emptylabel2.snp.makeConstraints {
            $0.width.equalTo(emptyWidth)
            $0.height.equalTo(emptyHeight)
        }
    }
}
