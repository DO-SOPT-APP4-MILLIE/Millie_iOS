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
        
    }
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
}
