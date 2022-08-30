//
//  UILabelExtension.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/05/12.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0, alignment: NSTextAlignment = .left) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.alignment = alignment
        
        let attributeString = NSMutableAttributedString(string: labelText)

        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributeString.length))
        
        self.attributedText = attributeString
    }
    
    func setLetterSpacing(letterSpacing: CGFloat = 0.0) {
        guard let labelText = self.text else { return }
        
        let attributeString = NSMutableAttributedString(string: labelText)

        attributeString.addAttribute(.kern, value:letterSpacing, range:NSMakeRange(0, attributeString.length))
        
        self.attributedText = attributeString
    }
}
