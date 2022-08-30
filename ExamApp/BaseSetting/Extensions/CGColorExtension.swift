//
//  CGColorExtension.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

extension CGColor {
    
    class var beeYellow: CGColor {
        return UIColor(red: 252/255, green: 208/255, blue: 0/255, alpha: 1.0).cgColor
    }
    
    class func color(_ c: UIColor, alpha: CGFloat? = nil) -> CGColor {
        let a = alpha == nil ? 1:alpha!
        return c.withAlphaComponent(a).cgColor
    }
    
    class func rgb(_ rgb: CGFloat, _ alpha: CGFloat? = nil) -> CGColor {
        let a = alpha == nil ? 1:alpha!
        return UIColor(red: rgb/255, green: rgb/255, blue: rgb/255, alpha: a).cgColor
    }
    
    class func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> CGColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha).cgColor
    }
    
}
