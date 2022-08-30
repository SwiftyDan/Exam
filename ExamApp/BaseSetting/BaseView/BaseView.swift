//
//  BaseView.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class BaseView: UIView {
    lazy var moreBtn: BaseButton = {
        let btn = BaseButton()
       // btn.round(0, color: .rgb(226), selectedColor: .rgb(226), width: 1, backgroud: .rgb(58,90,152,255))
        btn.title("See more", color: .lightGray, size: 12, alignment: .center, isBold: true)
        btn.image(normal: "rightarrow")
       // btn.layer.cornerRadius = 20
        btn.alignHorizontal(spacing: -80)
        return btn
    }()
    lazy var baseTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .godo_M(16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    lazy var underLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .beeYellow
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func round(_ value: CGFloat, color: UIColor, width: CGFloat) {
        layer.cornerRadius = value
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        clipsToBounds = true
    }
    
    func showTitleLabel(_ text: String, top: CGFloat? = 0, leading: CGFloat? = 0, underLine: Bool) {
        addSubview(baseTitleLabel)
        addSubview(moreBtn)
        baseTitleLabel.text = text
        baseTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: top!).isActive = true
        baseTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading!).isActive = true
        moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        moreBtn.topAnchor.constraint(equalTo: topAnchor, constant: top!).isActive = true
        moreBtn.heightAnchor.constraint(equalToConstant: 15).isActive = true
        moreBtn.widthAnchor.constraint(equalToConstant: 15).isActive = true
        if underLine {
            let wid = baseTitleLabel.sizeThatFits(baseTitleLabel.frame.size)
            
            addSubview(underLineView)
            bringSubviewToFront(baseTitleLabel)
            underLineView.bottomAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor).isActive = true
            underLineView.leadingAnchor.constraint(equalTo: baseTitleLabel.leadingAnchor).isActive = true
            underLineView.heightAnchor.constraint(equalToConstant: 9).isActive = true
            underLineView.widthAnchor.constraint(equalToConstant: wid.width).isActive = true
            
//            let attributedStr = NSMutableAttributedString(string: text)
//            attributedStr.addAttribute(.underlineStyle, value: 7, range: (text as NSString).range(of: text))
//            attributedStr.addAttribute(.underlineColor, value: UIColor.rgb(252,208,0), range: (text as NSString).range(of:text))
//            baseTitleLabel.attributedText = attributedStr
        }

    }
    
}
