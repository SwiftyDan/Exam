//
//  BaseButton.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func image(normal: String, selected: String? = nil) {
        setImage(UIImage(named: normal), for: .normal)
        guard let selected = selected else {return}
        setImage(UIImage(named: selected), for: .highlighted)
        setImage(UIImage(named: selected), for: .selected)
    }
    
    func title(_ text: String, color: UIColor, selectedColor: UIColor? = nil, size: CGFloat, alignment: ContentHorizontalAlignment? = .left, isBold : Bool = false) {
        setTitle(text, for: .normal)
        setTitleColor(color, for: .normal)
        if let selectedColor = selectedColor {
            setTitleColor(selectedColor, for: .highlighted)
            setTitleColor(selectedColor, for: .selected)
        }
        titleLabel?.font = isBold ? .godo_B(size):.godo_M(size)
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        contentHorizontalAlignment = alignment!
    }
    
    func round(_ value: CGFloat, color: UIColor, selectedColor: UIColor? = nil, width: CGFloat, backgroud: UIColor? = nil) {
        if let backgroud = backgroud {
            backgroundColor = backgroud
        }
        layer.cornerRadius = value
        layer.borderColor = color.cgColor
        if let selectedColor = selectedColor {
            if isSelected {
                layer.borderColor = selectedColor.cgColor
            }
        }
        layer.borderWidth = width
        clipsToBounds = true
    }
    
    func alignVertical(spacing: CGFloat = 6.0) {
        
        guard let imageSize = imageView?.image?.size, let text = titleLabel?.text, let font = titleLabel?.font else { return }

        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageSize.width,
            bottom: -(imageSize.height + spacing),
            right: 0.0
        )

        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: -(titleSize.height + spacing),
            left: 0.0,
            bottom: 0.0, right: -titleSize.width
        )

        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: edgeOffset,
            left: 0.0,
            bottom: edgeOffset,
            right: 0.0
        )
    }
    
    func alignHorizontal(spacing: CGFloat = 6.0) {
        
        
        guard let imageSize = imageView?.image?.size, let text = titleLabel?.text, let font = titleLabel?.font else { return }

        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: spacing,
            bottom: 0.0,
            right: 0.0
        )

        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -spacing,
            bottom: 0.0, right: 0.0
        )

        let edgeOffset = abs(titleSize.width - imageSize.width) / 2.0
        contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: spacing,
            bottom: 0.0,
            right: spacing
        )
    }
    
    func alignHorizontalImageBack(size: CGFloat = (screen_width-28)/3, spacing: CGFloat = 12.0) {
        
        guard let imageSize = imageView?.image?.size, let text = titleLabel?.text, let font = titleLabel?.font else { return }

        titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: 0.0,
            right: 0.0
        )

        let titleSize = text.size(withAttributes: [.font: font])
        imageEdgeInsets = UIEdgeInsets(
            top: 5.0,
            left: size - imageSize.width - spacing*2,
            bottom: 5.0, right: 0.0
        )
        
        contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: spacing,
            bottom: 0.0,
            right: spacing
        )

    }
    
    func alignHorizontalImageBack(titleWidth: CGFloat, spacing: CGFloat = 10) {
        
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        self.titleLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.titleLabel?.widthAnchor.constraint(equalToConstant: titleWidth).isActive = true
        
        self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: titleWidth + spacing).isActive = true
        
    }
    
}

