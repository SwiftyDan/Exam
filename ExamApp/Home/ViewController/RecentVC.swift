//
//  RecentVC.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit
import Firebase

import AuthenticationServices
import FBSDKLoginKit
import SwiftUI
import Combine


final class RecentVC: BaseViewController {
    
    // MARK: - Properties
    var offSet: CGFloat = 0
    var lineOffSet: CGFloat = 0

    private var categHeight: NSLayoutConstraint!
    private var basketTableViewHeight: NSLayoutConstraint!

    private let recentView = RecentView()

 
    // MARK: - UI Component
    private let scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
  

   
    let containerView = UIView()


    @objc private func didClickSearchButton() {
        
        let vc = SearchVC(text:"", searchCode: String(10))
        show(vc)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetting()
        
        view.addSubview(scrollContentView)
        scrollContentView.addSubview(scrollView)
        scrollView.addSubview(recentView)
       
        layout()
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

       
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // getMainBanner()
      
        navigationItem.hidesBackButton = true
        getRecent()
     
      
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow)
        navigationController?.navigationBar.backgroundColor = .beeYellow
       // self.scrollView.setContentOffset(CGPoint(x: 30, y: 30), animated: true)
    }
    
    // MARK: - Private Method
    private func initialSetting() {
        view.backgroundColor = .rgb(243,243,243,255)
        navigationController?.navigationBar.backgroundColor = .beeYellow
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow)

        getRecent()
        recentView.delegate = self
       
       
        
      
       
    }
    

    


    
    // MARK: - Network

    
    private func getRecent() {

        guard let data = selectedMenuMartx else {return}

            self.recentView.configure(data)
      
    
     
        
    }
    

    
    
    // MARK: - Selector
   
 
   

}

// MARK: - LayOut
extension RecentVC {

    private func layout() {
        let margins = view.safeAreaLayoutGuide
        
     
        
        scrollContentView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
     
        scrollView.topAnchor.constraint(equalTo: scrollContentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: scrollContentView.heightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: recentView.bottomAnchor, constant: 5).isActive = true
        recentView.heightAnchor.constraint(equalToConstant: screen_height).isActive = true
        recentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        recentView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        recentView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
       

    
    }
}




// MARK: - recentViewDelegate
extension RecentVC: RecentViewDelegate {
    func recentViewDidSelect(_ view: RecentView, category: SelectedMenu) {
      
            let vc = DetailsViewController(nil, recent: category)
            show(vc)

    }

}
