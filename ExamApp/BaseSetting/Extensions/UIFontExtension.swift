//
//  UIFontExtension.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func godo_M(_ size: CGFloat) -> UIFont {
        return UIFont(name: "GodoM", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func godo_B(_ size: CGFloat) -> UIFont {
        return UIFont(name: "GodoB", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
