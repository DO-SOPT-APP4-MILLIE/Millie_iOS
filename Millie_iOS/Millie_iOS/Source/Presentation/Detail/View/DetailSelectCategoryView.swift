//
//  DetailSelectCategoryView.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/22/23.
//

import UIKit

import SnapKit

class DetailSelectCategoryView: UIView {

    public let electricBookButton: UIButton = {
        let button = UIButton()
        let electricIcon = UIImage(named: "detail_ic_book_open")
        button.backgroundColor = .white
        button.setImage(electricIcon, for: .normal)
        button.setTitle("전자책", for: .normal)
        button.titleLabel?.font = .spoqaHanSanNeo(.bold, size: 14)
        button.setTitleColor(.darkGrey03, for: .normal)
        button.tintColor = .darkGrey03
        
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 18
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.layer.shadowRadius = 12
        
        return button
    }()
    
    public let audioBookButton: UIButton = {
        let button = UIButton()
        let electricIcon = UIImage(named: "detail_ic_audio")
        button.backgroundColor = .lightGrey02
        button.setImage(electricIcon, for: .normal)
        button.setTitle("오디오북", for: .normal)
        button.titleLabel?.font = .spoqaHanSanNeo(.regular, size: 14)
        button.setTitleColor(.lightGrey07, for: .normal)
        button.tintColor = .lightGrey07
        
        button.layer.cornerRadius = 15
        
        return button
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
        self.addSubviews(electricBookButton, audioBookButton)
    }
    
    private func setupLayout() {
        electricBookButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalTo(self.snp.centerX).offset(-8)
            $0.width.equalTo(84)
            $0.height.equalTo(36)
        }
        
        audioBookButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(self.snp.centerX)
            $0.width.equalTo(97)
            $0.height.equalTo(36)
        }
    }

}
