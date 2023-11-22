//
//  UIFont+.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/20/23.
//

import UIKit

extension UIFont {
    
    //Bold
    class var millieHeader1: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 32)!
    }
    
    class var millieHeader2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 20)!
    }
    
    class var millieHeader3: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 19)!
    }
    
    class var millieHeader5: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 16)!
    }
    
    class var millieSubHeader2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 15)!
    }
    
    class var millieSubHeader4: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 14)!
    }

    class var millieSubHeader5: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Bold", size: 12)!
    }
    
    //Medium
    class var millieHeader6: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 20)!
    }
    
    class var millieSubHeader6: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 14)!
    }
    
    class var millieSubHeader7: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 13)!
    }
    
    class var millieSubHeader8: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 12)!
    }
    
    class var millieBody10: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 11)!
    }
    
    class var millieBody11: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 9)!
    }
    
    class var millieBody12: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Medium", size: 6)!
    }
    
    //Regular
    class var millieBody1: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 19)!
    }
    
    class var millieBody2: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 16)!
    }
    
    class var millieBody4: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 14)!
    }
    
    class var millieBody5: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 13)!
    }
    
    class var millieBody6: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 12)!
    }
    
    class var millieBody7: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 11)!
    }
    
    class var millieBody8: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 10)!
    }
    
    class var millieBody9: UIFont {
        return UIFont(name: "SpoqaHanSansNeo-Regular", size: 8)!
    }
    
    public enum SpoqaHanSanNeoType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }
    
    static func spoqaHanSanNeo(_ type: SpoqaHanSanNeoType, size: CGFloat) -> UIFont {
        return UIFont(name: "SpoqaHanSansNeo-\(type.rawValue)", size: size)!
    }
}
