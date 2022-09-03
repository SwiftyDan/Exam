//
//  RecentCell.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit

class RecentCell: UICollectionViewCell {
    // MARK: - UI Component

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
    
    func configure(_ category: SelectedMenu?) {
  
        contentView.addSubview(self.imageView)
        contentView.addSubview(titleLabel)
        imageView.addSubview(idLabel)
        imageView.backgroundColor = .white
        layout2()
       
        if let imageUrl = category?.image_url, let url = URL(string: imageUrl) {
         
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url, options: [.memoryCacheExpiration(.days(3))])
            titleLabel.text = category?.title
            idLabel.text = "ID:\(category?.recipe_id ?? "")"
        }
           
           


        
    }
    
    // MARK: - Private Method
    
    private func initialSetting() {

    }
}

//MARK: - Layout
extension RecentCell {
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
