//
//  UIColor+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: alpha)
    }
}

extension UIColor{
    class var mainYello: UIColor {
        return UIColor(r:255, g: 235, b: 96)
    }
    
    class var subYello: UIColor {
        return UIColor(r: 252, g: 185, b: 13)
    }
    
    class var mainRed: UIColor {
        return UIColor(r: 225, g: 27, b: 32)
    }
    
    class var subRed: UIColor {
        return UIColor(r: 255, g: 137, b: 138)
    }
    
    class var mainPurple: UIColor {
        return UIColor(r: 164, g: 82, b: 245)
    }
    
    class var mainBlue: UIColor {
        return UIColor(r: 5, g: 114, b: 199)
    }
    
    class var subBlue: UIColor {
        return UIColor(r: 132, g: 180, b: 255)
    }
    
    class var milWhite: UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }
    
    class var milBlack: UIColor {
        return UIColor(r: 0, g: 0, b: 0)
    }
    
    class var lightGrey01: UIColor {
        return UIColor(r: 251, g: 251, b: 251)
    }
    
    class var lightGrey02: UIColor {
        return UIColor(r: 247, g: 247, b: 247)
    }
    
    class var lightGrey03: UIColor {
        return UIColor(r: 231, g: 231, b: 233)
    }
    
    class var lightGrey04: UIColor {
        return UIColor(r: 223, g: 223, b: 223)
    }
    
    class var lightGrey05: UIColor {
        return UIColor(r: 220, g: 220, b: 220)
    }
    
    class var lightGrey06: UIColor {
        return UIColor(r: 191, g: 191, b: 191)
    }
    
    class var lightGrey07: UIColor {
        return UIColor(r: 165, g: 165, b: 165)
    }
    
    class var darkGrey01: UIColor {
        return UIColor(r: 111, g: 111, b: 111)
    }
    
    class var darkGrey02: UIColor {
        return UIColor(r: 85, g: 85, b: 85)
    }
    
    class var darkGrey03: UIColor {
        return UIColor(r: 36, g: 36, b: 36)
    }
}
