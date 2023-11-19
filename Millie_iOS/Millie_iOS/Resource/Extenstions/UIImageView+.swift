//
//  UIImageView+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        guard let url = url else { return }
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))],
                        progressBlock: nil)
        }
    }
}
