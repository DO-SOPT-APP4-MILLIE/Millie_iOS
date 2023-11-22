//
//  UIStackView+.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/21/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
