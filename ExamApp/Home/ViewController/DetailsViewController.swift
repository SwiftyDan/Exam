//
//  DetailsViewController.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 8/29/22.
//

import UIKit
import SwiftUI
import Combine
import Kingfisher

class  DetailsViewController : BaseViewController {

    // MARK: - Properties

    private var data: Photos?

    
    // MARK: - UI Component
    private let scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        return view
    }()
    // date
    private let dateLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(18), color: .black, alignment: .center)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
     
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titleLbl: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(18), color: .red, alignment: .center)
        label.text = "Title:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imgMethod: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white

       return imageView
   }()
    let shareBtn: BaseButton = {
        let btn = BaseButton()
        btn.title("Click to Share", color: .rgb(136), selectedColor: .rgb(136), size: 15, alignment: .right, isBold: false)
        btn.isSelected = true
        return btn
   }()
    
    
    // MARK: - Override
    init(data: Photos) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
      
        print(data,"STATEEE")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        view.addSubview(scrollContentView)
        scrollContentView.addSubview(scrollView)
        scrollView.addSubview(imgMethod)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(shareBtn)
        scrollView.addSubview(titleLbl)
      
        let margins = view.safeAreaLayoutGuide
        
     
        scrollContentView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: scrollContentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: scrollContentView.heightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        
        imgMethod.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20).isActive = true
        imgMethod.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
      
        titleLbl.topAnchor.constraint(equalTo: shareBtn.bottomAnchor).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: imgMethod.leadingAnchor).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: titleLbl.bottomAnchor,constant: 10).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: imgMethod.centerXAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: imgMethod.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20).isActive = true
        
        shareBtn.topAnchor.constraint(equalTo: imgMethod.bottomAnchor).isActive = true
        shareBtn.leadingAnchor.constraint(equalTo: imgMethod.leadingAnchor).isActive = true
      
        imgMethod.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imgMethod.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        loadData()
       
    }
   
    
    // MARK: - Private Method
    private func initialSetting() {
       
        showBackButton()
       
           
    }
    

    
    func setNavTitle(title: String) {
       
       let containerView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       let navTitleLabel: UILabel = {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = title
           label.textAlignment = .center
           label.font = .godo_B(16)
           label.textColor = .black
      
           return label
       }()
       
    
       
       containerView.addSubview(navTitleLabel)
     
       
       containerView.widthAnchor.constraint(equalToConstant: screen_width/2).isActive = true
       containerView.heightAnchor.constraint(equalToConstant: navigationController?.navigationBar.frame.height ?? 48).isActive = true
       
       navTitleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
       navTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
       navTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
       
   
       
      
       
       setTitleView(view: containerView)
   }
   
}

// MARK: - Layout
extension DetailsViewController {
   
   
    private func loadData() {
        shareBtn.addTarget(self, action: #selector(didClickLogin(_:)), for: .touchUpInside)
 
        if let imageUrl = data?.url, let url = URL(string: imageUrl) {
          
            imgMethod.kf.indicatorType = .activity
           
                dateLabel.text = data?.title
              
            imgMethod.kf.setImage(with: url, placeholder: UIImage(named: "Home-fill"), options: nil, progressBlock: nil, completionHandler: nil)
            setNavTitle(title: "\(data?.id ?? 0)")
        }
        
    }
    @objc func didClickLogin(_ sender: UIButton) {
        let someText:String = data?.title ?? ""
        let objectsToShare:URL = URL(string: data?.thumbnailUrl ?? "")!
          let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
          let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
          activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]

          self.present(activityViewController, animated: true, completion: nil)

    }
  
   
}




