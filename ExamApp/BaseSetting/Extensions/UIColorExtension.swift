//
//  File.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

extension UIColor {
    class var beeYellow: UIColor {
        return UIColor(red: 252/255, green: 208/255, blue: 0/255, alpha: 1.0)
    }
    class var beeBlue: UIColor {
        return UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1.0)
    }
    class var beeRed: UIColor {
        return UIColor(red: 241/255, green: 62/255, blue: 0/255, alpha: 1.0)
    }
    class var beeBrown: UIColor {
        return UIColor(red: 81/255, green: 68/255, blue: 57/255, alpha: 1.0)
    }
    
    class func color(_ c: UIColor, alpha: CGFloat? = nil) -> UIColor {
        let a = alpha == nil ? 1:alpha!
        return c.withAlphaComponent(a)
    }
    
    class func rgb(_ rgb: CGFloat, _ alpha: CGFloat? = nil) -> UIColor {
        let a = alpha == nil ? 1:alpha!
        return UIColor(red: rgb/255, green: rgb/255, blue: rgb/255, alpha: a)
    }
    
    class func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat? = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha!)
    }
}
