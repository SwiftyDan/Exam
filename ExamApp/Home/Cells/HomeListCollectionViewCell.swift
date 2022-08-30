//
//  HomeListCollectionViewCell.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/27.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit
import Kingfisher
class HomeListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Component
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let titleLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_B(14), color: .black, alignment: .left)
        return label
    }()
    private let categoryLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(12), color: .rgb(129), alignment: .left)
        label.numberOfLines = 0
        return label
    }()
    private let ratingLabel: BaseButton = {
        let btn = BaseButton()
        btn.image(normal: "listStar")
        btn.title("", color: .rgb(129), size: 11, alignment: .right, isBold: false)
        btn.alignHorizontal(spacing: 2)
        
        return btn
    }()
    private let newImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        imageView.image = UIImage(named: "badgeNew")
        return imageView
    }()
    private let recomendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        imageView.image = UIImage(named: "badgeFeatured")
        return imageView
    }()
    private let recomendLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(8), color: .white, alignment: .center)
        label.text = "Sticker.Recomend.Title".localized
        label.isHidden = true
        return label
    }()
    private let offImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        imageView.image = UIImage(named: "badgeOff")
        return imageView
    }()
    private let offLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(11), color: .white, alignment: .center)
        label.numberOfLines = 2
        return label
    }()
    private let freeFeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        imageView.image = UIImage(named: "badgeDvfree")
        return imageView
    }()
    
    // MARK: - Override
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetting()
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(ratingLabel)
        containerView.addSubview(newImageView)
        containerView.addSubview(recomendImageView)
        containerView.addSubview(recomendLabel)
        containerView.addSubview(offImageView)
        containerView.addSubview(offLabel)
        containerView.addSubview(freeFeeImageView)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Internal Method
    
    func configure(_ list: CompList) {
        if let imageUrl = list.img, let url = URL(string: imageUrl) {
            
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url, options: [.memoryCacheExpiration(.days(3))])
//            DispatchQueue.global().async { [weak self] in
//                if let data = try? Data(contentsOf: url) {
//                    if let image = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            let newImage = image.resizeImage(image: image, newWidth: self?.contentView.frame.width ?? 160)
//                            self?.imageView.image = newImage
//                        }
//                    }
//                }
//            }
        }
        
        
        titleLabel.text = list.comp_nm
        categoryLabel.text = list.comp_ctg_nm
        
        if let grade = list.grade, grade != "0.0" {
            ratingLabel.isHidden = false
            ratingLabel.setTitle(grade, for: .normal)
        } else {
            ratingLabel.isHidden = true
        }
        
        if let new = list.newYn, new == "Y" {
            newImageView.isHidden = false
        } else {
            newImageView.isHidden = true
        }
        
        if let recomend = list.favyn, recomend == "Y" {
            recomendImageView.isHidden = false
            recomendLabel.isHidden = false
        } else {
            recomendImageView.isHidden = true
            recomendLabel.isHidden = true
        }
        
        if let off = list.discount_delitip_yn, off == "Y" {
            freeFeeImageView.isHidden = false

        } else {
            freeFeeImageView.isHidden = true

        }
        
        if let rate = list.discount_rate, rate != "0", rate != "" {
            offImageView.isHidden = false
            offLabel.isHidden = false
            offLabel.text = String(format: "ContentList.Discount".localized, rate)
        } else {
            offImageView.isHidden = true
            offLabel.isHidden = true
        }
        
    }
    
    // MARK: - Private Method
    
    private func initialSetting() {
        backgroundColor = .white
        clipsToBounds = true
        layer.masksToBounds = false
        layer.cornerRadius = 10
        layer.shadowColor = .rgb(0, 0.1)
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 4
    }
}

//MARK: - Layout
extension HomeListCollectionViewCell {
    
    private func layout() {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 11).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -10).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        ratingLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        newImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        newImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6).isActive = true
        newImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        newImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        recomendImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -6).isActive = true
        recomendImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        recomendImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        recomendImageView.widthAnchor.constraint(equalToConstant: 83).isActive = true
        
        recomendLabel.centerYAnchor.constraint(equalTo: recomendImageView.centerYAnchor).isActive = true
        recomendLabel.leadingAnchor.constraint(equalTo: recomendImageView.leadingAnchor, constant: 22).isActive = true
        
        offImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        offImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        offImageView.heightAnchor.constraint(equalToConstant: 41).isActive = true
        offImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        offLabel.topAnchor.constraint(equalTo: offImageView.topAnchor, constant: 5).isActive = true
        offLabel.leadingAnchor.constraint(equalTo: offImageView.leadingAnchor, constant: 2).isActive = true
        offLabel.trailingAnchor.constraint(equalTo: offImageView.trailingAnchor, constant: -2).isActive = true
        
        freeFeeImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -4).isActive = true
        freeFeeImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6).isActive = true
        freeFeeImageView.heightAnchor.constraint(equalToConstant: 26.5).isActive = true
        freeFeeImageView.widthAnchor.constraint(equalToConstant: 26.5).isActive = true
    }
}
