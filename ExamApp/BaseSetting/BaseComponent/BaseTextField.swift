//
//  BaseTextField.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .none
        font = .godo_M(15)
        textColor = .black
        let placeholderFont = value(forKey: "placeholderLabel") as? UILabel
        placeholderFont?.font = .godo_M(15)
        placeholderFont?.textColor = .rgb(193)
        textAlignment = .left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func round(_ value: CGFloat, color: UIColor, width: CGFloat, backgroud: UIColor? = .white) {
        if let backgroud = backgroud {
            backgroundColor = backgroud
        }
        layer.cornerRadius = value
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        clipsToBounds = true
    }

}
