//
//  File.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/23/23.
//

import UIKit

extension UILabel {
    
    func partFontChange(targetStrings: [String], font: UIFont, textColor: UIColor) {
        guard let fullText = self.text else { return }

        let attributedString = NSMutableAttributedString(string: fullText)

        for targetString in targetStrings {
            let range = (fullText as NSString).range(of: targetString)
            attributedString.addAttribute(.font, value: font, range: range)
            attributedString.addAttribute(.foregroundColor, value: textColor, range: range)
        }

        self.attributedText = attributedString
    }
    
    static func todayLabel() -> UILabel {
        let label = UILabel()
        label.font = .millieHeader3
        label.textColor = .milBlack
        return label
    }
}
