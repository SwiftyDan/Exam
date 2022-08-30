//
//  CustomPageControl.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/24.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {

    let spacing: CGFloat = 2
    let width: CGFloat = 6
    let height: CGFloat = 6
    var total: CGFloat = 0
    
    
    var currentPageImage: UIImage {
        return UIImage(named: "pageOn")!
    }
    
    var otherPagesImage: UIImage {
        return  UIImage(named: "pageOff")!
    }
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pageIndicatorTintColor = .clear
        currentPageIndicatorTintColor = .clear
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    
    private func updateDots() {
        
        for (index, subview) in subviews.enumerated() {
            var imageView: UIImageView
            if let existingImageview = getImageView(forSubview: subview) {
                imageView = existingImageview
                imageView.image = currentPageImage

            } else {
                imageView = UIImageView(image: otherPagesImage)
                subview.addSubview(imageView)
//                imageView.center = subview.center
                imageView.frame.origin.x = subview.frame.origin.x
                imageView.frame.origin.y = subview.frame.origin.y
                subview.clipsToBounds = false
            }
            subview.backgroundColor = .clear
            imageView.image = currentPage == index ? currentPageImage : otherPagesImage
        }
        
    }
    
    private func getImageView(forSubview view: UIView) -> UIImageView? {
        if let imageView = view as? UIImageView {
            return imageView
        } else {
            let view = view.subviews.first { (view) -> Bool in
                return view is UIImageView
                } as? UIImageView
            
            return view
        }
    }
}
