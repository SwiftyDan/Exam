//
//  HomeViewController.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/24.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit
import Firebase

import AuthenticationServices
import FBSDKLoginKit
import SwiftUI
import Combine


final class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    var offSet: CGFloat = 0
    var lineOffSet: CGFloat = 0

    private var categHeight: NSLayoutConstraint!
    private var basketTableViewHeight: NSLayoutConstraint!

    private let categoryView = CategoryView()

 
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
    private let announceLbl: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .boldSystemFont(ofSize: 16), color: .black, alignment: .center)
        label.text = "HomeView.Announcement".localized
        
        return label
    }()
    private let announceLbl2: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .boldSystemFont(ofSize: 13), color: .lightGray, alignment: .center)
        label.text = "HomeView.Announcement2".localized
       
        return label
    }()
    private let announcementView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
    }()
    private let beeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ham")
        return imageView
    }()
    private let beeLabel: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(13), color: .black, alignment: .left)
        return label
    }()
    private let beeButton: BaseButton = {
        let btn = BaseButton()
        return btn
    }()
    private let loginButton: BaseButton = {
        let btn = BaseButton()
        btn.title("Home.HeaderView.ButtonTitle".localized, color: .rgb(136), selectedColor: .rgb(136), size: 15, alignment: .right, isBold: false)
        btn.isSelected = true
        return btn
    }()
    private let searchView : UIView = {
        let view = UIView()
      
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
    
        return view
    }()
    private let views : UIView = {
        let view = UIView()
        view.layer.borderColor = .rgb(246,246,246,255)
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .rgb(243,243,243,255)
        return view
    }()
    private let searchBtn: BaseButton = {
        let btn = BaseButton()
       // btn.round(0, color: .rgb(226), selectedColor: .rgb(226), width: 1, backgroud: .rgb(58,90,152,255))
        btn.title("Search", color: .lightGray, size: 15, alignment: .left, isBold: false)
        btn.image(normal: "icoSearch")
       // btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(didClickSearchButton), for: .touchUpInside)
        btn.alignHorizontal(spacing: 10)
        return btn
    }()
    private let filterBtn: BaseButton = {
        let btn = BaseButton()
       // btn.round(0, color: .rgb(226), selectedColor: .rgb(226), width: 1, backgroud: .rgb(58,90,152,255))
        btn.backgroundColor = .rgb(243,243,243,255)
        btn.image(normal: "Filter")
       // btn.layer.cornerRadius = 20
        btn.layer.cornerRadius = 15
        btn.alignHorizontal(spacing: 10)
        return btn
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
        view.addSubview(searchView)
        searchView.addSubview(views)
        views.addSubview(searchBtn)
        searchView.addSubview(filterBtn)
        scrollContentView.addSubview(scrollView)
     
        
        scrollView.addSubview(announcementView)
        announcementView.addSubview(announceLbl)
        announcementView.addSubview(announceLbl2)
        
        scrollView.addSubview(categoryView)
       
        layout()
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        navigationController?.interactivePopGestureRecognizer?.delegate = self
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        if let nick = nickx {
            loginButton.setTitle(nick, for: .normal)
            loginButton.isSelected = false
        } else {
            loginButton.setTitle("Home.HeaderView.ButtonTitle".localized, for: .normal)
            loginButton.isSelected = true
        }
        
       
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // getMainBanner()
      
        navigationItem.hidesBackButton = true
        getCategory()
     
      
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow)
        navigationController?.navigationBar.backgroundColor = .beeYellow
       // self.scrollView.setContentOffset(CGPoint(x: 30, y: 30), animated: true)
    }
    
    // MARK: - Private Method
    private func initialSetting() {
        view.backgroundColor = .rgb(243,243,243,255)
        navigationController?.navigationBar.backgroundColor = .beeYellow
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow)

        
        categoryView.delegate = self
       
        getCategory()
  
        
      
       
    }
    

    


    
    // MARK: - Network

    
    private func getCategory() {
        
        HomeService().getRecipes(q:"salad") { [weak self] (result, error) in
       
            guard let self = self, let result = result else{return}
          
            self.categoryView.configure(result)
      
        }
     
        
    }
    

    
    
    // MARK: - Selector
   
 
   

}

// MARK: - LayOut
extension HomeViewController {

    private func layout() {
        let margins = view.safeAreaLayoutGuide
        
        searchView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 10).isActive = true
        searchView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        searchView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 11).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        
        views.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        views.centerYAnchor.constraint(equalTo: views.centerYAnchor).isActive = true
       
        views.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 11).isActive = true
        views.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -11).isActive = true
        
        views.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        searchBtn.leadingAnchor.constraint(equalTo: views.leadingAnchor,constant: 20).isActive = true
        searchBtn.centerYAnchor.constraint(equalTo: views.centerYAnchor).isActive = true
        searchBtn.trailingAnchor.constraint(equalTo: views.trailingAnchor).isActive = true


        filterBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        filterBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        filterBtn.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        filterBtn.trailingAnchor.constraint(equalTo: searchView.trailingAnchor,constant: -20).isActive = true
        
    
        
        scrollContentView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
     
        scrollView.topAnchor.constraint(equalTo: scrollContentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: scrollContentView.heightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 5).isActive = true
        
        categoryView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        categoryView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor).isActive = true
        categoryView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor).isActive = true
        categoryView.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor).isActive = true
      

    
    }
    func returnConfigure(selected: [SelectedMenu]) {
        
        guard let sel = selectedMenuMartx else {
            selectedMenuMartx = selected
           
           
           
            return
        }
        let selectedMenu = sel + selected
        selectedMenuMartx = selectedMenu
        
        if sel.contains(where: {$0.recipe_id == selected[0].recipe_id}) {
            var selectedMenu = [SelectedMenu]()
            for i in 0 ..< sel.count {
                if let hashKey = sel[i].recipe_id, hashKey != "" {
                    if hashKey == selected[0].recipe_id {
                        let newSel = sel[i]
                      
                        selectedMenu.append(newSel)
                    } else {
                        selectedMenu.append(sel[i])
                    }
                }
            }
            selectedMenuMartx = selectedMenu
            
        } else {
            let selectedMenu = sel + selected
            selectedMenuMartx = selectedMenu
        }
        
  
    }
}




extension HomeViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> HomeViewController {
        let main = HomeViewController()
        return main
    }

    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
    }
}



struct HomeViewController_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        HomeViewController()
        
    }
}


// MARK: - CategoryViewDelegate
extension HomeViewController: CategoryViewDelegate {
    func categoryViewDidSelect(_ view: CategoryView, category: Recipe) {
        var selectedMenu = [SelectedMenu]()
        selectedMenu.append(SelectedMenu(["title":category.title ?? "", "publisher":category.publisher ?? "", "source_url": category.source_url ?? "", "image_url": category.image_url ?? "", "social_rank": category.social_rank ?? "", "publisher_url": category.publisher_url ?? "","recipe_id": category.recipe_id ?? ""]))
       
     returnConfigure(selected: selectedMenu)

        let vc = DetailsViewController(category)
            show(vc)

    }
    
    
}
