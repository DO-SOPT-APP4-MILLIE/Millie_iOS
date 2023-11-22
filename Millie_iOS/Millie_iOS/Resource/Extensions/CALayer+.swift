//
//  CALayer+.swift
//  Millie_iOS
//
//  Created by 변상우 on 11/21/23.
//

import UIKit

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: frame.height)
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)                
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
