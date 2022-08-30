//
//  PhotosCell.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 8/29/22.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {
    // MARK: - UI Component
    var sectionz : [Int] = []
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()

     let titleLabel: BaseLabel = {
        let label = BaseLabel()
         label.lineBreakMode = .byWordWrapping
         label.numberOfLines = 0
        label.configure(font: .godo_M(15), color: .black, alignment: .center)
        return label
    }()
    let idLabel: BaseLabel = {
       let label = BaseLabel()
        label.roundCorners(radius: 9, corners: .allCorners)
        label.backgroundColor = .black
       label.configure(font: .godo_M(15), color: .white, alignment: .center)
       return label
   }()
  
    // MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetting()

       
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Internal Method
    
    func configure(_ category: Photos,section : Int) {
  
        contentView.addSubview(self.imageView)
        contentView.addSubview(titleLabel)
        imageView.addSubview(idLabel)
        imageView.backgroundColor = .white
        layout2()
  
        if let imageUrl = category.url, let url = URL(string: imageUrl) {
          
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage(with: url, options: [.memoryCacheExpiration(.days(3))])
                titleLabel.text = category.title
                idLabel.text = "ID : \(20)"


        }
           
           


        
    }
    
    // MARK: - Private Method
    
    private func initialSetting() {

    }
}

//MARK: - Layout
extension HomeCategoryCollectionViewCell {
    private func layout2() {


        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
   
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: -20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor,constant: -20).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10).isActive = true
            
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
  
        idLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: -5).isActive = true
        idLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor,constant: -5).isActive = true
        idLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
    
    }
    
}

extension UIView {

func roundCorners(radius: CGFloat = 20, corners: UIRectCorner = .allCorners) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            var arr: CACornerMask = []
            
            let allCorners: [UIRectCorner] = [.topLeft, .topRight, .bottomLeft, .bottomRight, .allCorners]
            
            for corn in allCorners {
                if(corners.contains(corn)){
                    switch corn {
                    case .topLeft:
                        arr.insert(.layerMinXMinYCorner)
                    case .topRight:
                        arr.insert(.layerMaxXMinYCorner)
                    case .bottomLeft:
                        arr.insert(.layerMinXMaxYCorner)
                    case .bottomRight:
                        arr.insert(.layerMaxXMaxYCorner)
                    case .allCorners:
                        arr.insert(.layerMinXMinYCorner)
                        arr.insert(.layerMaxXMinYCorner)
                        arr.insert(.layerMinXMaxYCorner)
                        arr.insert(.layerMaxXMaxYCorner)
                    default: break
                    }
                }
            }
            self.layer.maskedCorners = arr
        } else {
            self.roundCornersBezierPath(corners: corners, radius: radius)
        }
    }
    
    private func roundCornersBezierPath(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
