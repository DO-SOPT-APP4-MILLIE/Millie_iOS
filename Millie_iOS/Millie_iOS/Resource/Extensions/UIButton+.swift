//
//  UIButton+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

import Kingfisher

extension UIButton {
    static func todayButton() -> UIButton {
        let button = UIButton()
        button.setImage(Image.arrowRight, for: .normal)
        return button
    }
  
    func kfSetButtonImage(url : String, state: UIControl.State) {
        if let url = URL(string: url) {
            kf.setImage(with: url,
                        for: state, placeholder: nil,
                        options: [.transition(.fade(1.0))],
                        progressBlock: nil)
        }
    }
  
    func alignTextBelow(spacing: CGFloat = 4.0) {
        guard let image = self.imageView?.image else {
            return
        }

        guard let titleLabel = self.titleLabel else {
            return
        }

        guard let titleText = titleLabel.text else {
            return
        }

        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font as Any
        ])

        titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }
    
    func setButtonAttributedTitle(text: String, font: UIFont, color: UIColor) {
        let attributedString = NSMutableAttributedString(string: text, attributes: [.font: font, .foregroundColor: color])
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
