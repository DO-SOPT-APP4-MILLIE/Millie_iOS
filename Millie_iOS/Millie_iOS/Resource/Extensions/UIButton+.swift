//
//  UIButton+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

import Kingfisher

extension UIButton {
    func kfSetButtonImage(url : String, state: UIControl.State) {
        if let url = URL(string: url) {
            kf.setImage(with: url,
                        for: state, placeholder: nil,
                        options: [.transition(.fade(1.0))],
                        progressBlock: nil)
        }
    }
    
    static func todayButton() -> UIButton {
        let button = UIButton()
        button.setImage(Image.arrowRight, for: .normal)
        return button
    }
}
