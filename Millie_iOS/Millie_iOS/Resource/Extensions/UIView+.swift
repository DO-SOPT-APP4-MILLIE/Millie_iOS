//
//  UIView+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
