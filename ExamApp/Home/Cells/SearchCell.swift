//
//  SearchCell.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit

class SearchCell: UITableViewCell {

    // MARK: - Properties
    
    // MARK: - UI Component
    private let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = false
        return imageView
    }()

    private let compNameLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(14), color: .black, alignment: .left)
        label.numberOfLines = 0
        return label
    }()
    private let ratingLabel: BaseButton = {
        let btn = BaseButton()
      
        btn.title("", color: .black, size: 11, alignment: .left, isBold: false)
      btn.alignHorizontal(spacing: 0)
        return btn
    }()
    private let reviewLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(11), color: .rgb(129), alignment: .left)
        return label
    }()
    private let exLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(11), color: .rgb(129), alignment: .left)
        return label
    }()

    
    // MARK: - Override
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialSetting()
        contentView.addSubview(imgView)
        contentView.addSubview(compNameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(reviewLabel)
      //  contentView.addSubview(exLabel)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Private Method
    
    private func initialSetting() {
        
    }
    
    // MARK: - Internal Method
    
    func configure(_ list: Recipe) {
 
     
        if let url = URL(string: list.image_url ?? ".") {
                    self.imgView.kf.setImage(with: url)
                }
        

        compNameLabel.text = list.title
        ratingLabel.setTitle("Price :\(list.title ?? "0.0")", for: .normal)
      //  ratingLabel.removeFromSuperview()
        reviewLabel.text = "Discount Price : \(list.title!)"
      //  exLabel.text = "Discount rate: \(list.discount_rate!)"
        
    }
}

//MARK: - Layout
extension SearchCell {
    
    private func layout() {
        contentView.bottomAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 12).isActive = true
        
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        compNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        compNameLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10).isActive = true
        compNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        ratingLabel.topAnchor.constraint(equalTo: compNameLabel.bottomAnchor).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: compNameLabel.leadingAnchor).isActive = true
        
        reviewLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true
        reviewLabel.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor).isActive = true
        
       
    }
}
