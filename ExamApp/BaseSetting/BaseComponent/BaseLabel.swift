//
//  BaseLabel.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {

    var insets : UIEdgeInsets = UIEdgeInsets.zero
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    // MARK: - Internal Method
    func configure(font: UIFont, color: UIColor, alignment: NSTextAlignment = .left, padding: CGFloat? = nil) {
        self.font = font
        textColor = color
        textAlignment = alignment
        insets = UIEdgeInsets(top: 0, left: CGFloat(padding ?? 0), bottom: 0, right: CGFloat(padding ?? 0))
    }
    
}
