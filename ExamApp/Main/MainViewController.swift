//
//  MainViewController.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/24.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit
import SwiftUI
import Combine



final class MainViewController: UITabBarController {
    // MARK: - Properties
   
    private var currentLat = ""
    private var currentLng = ""
    
    // MARK: - UI Component
    private let ciStackView: UIStackView = {
        let view = UIStackView()
        view.frame = CGRect(x: 0, y: 0, width: 94, height: 16)
        view.axis = .horizontal
        view.alignment = .leading
        view.distribution = .fill
        return view
    }()
    private let ciImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ci_new")
        imageView.frame = CGRect(x: 0, y: 0, width: 98, height: 26)
        return imageView
    }()
    private let ciContainerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 98, height: 26)
        return view
    }()
    private let alertButton: BaseButton = {
        let button = BaseButton(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        return button
    }()
    private let drawerBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        btn.setImage(UIImage(named: "ham"), for: .normal)
        return btn
    }()
    private let alertImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 18, height: 20))
        view.image = UIImage(named: "icoHeaderNoti")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let badgeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .beeRed
        view.layer.cornerRadius = 7.5
        view.layer.masksToBounds = true
        view.isHidden = true
        return view
    }()
    private let badgeCount: BaseLabel = {
        let label = BaseLabel()
        label.configure(font: .godo_M(9), color: .white, alignment: .center)
        return label
    }()
    
    //MARK: - child
    private let homeVC: HomeViewController = {
        let controller = HomeViewController()
        return controller
    }()
    private let recentVC: RecentVC = {
        let controller = RecentVC()
        return controller
    }()
    
    //MARK: - override

    private func setupTestingEnvironment(with arguments: [String]) {
   
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        var arguments = ProcessInfo.processInfo.arguments
        arguments.removeFirst()
        setupTestingEnvironment(with: arguments)
     
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .beeYellow
        navigationController?.navigationBar.barTintColor = .beeYellow
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        registerSocket() 
        initialSetting()
        self.delegate = self

        setIndex(index: 0)
        
    }
    private func registerSocket() {
        
       
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
      
  
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     

    }
    
    override func viewDidLayoutSubviews() {
     
//        tabBar.frame.size.height = 95
//        tabBar.frame.origin.y = view.frame.height - 95
        
        if screen_height > 667 {
            tabBar.frame.size.height = 90
            tabBar.frame.origin.y = view.frame.height - 90
        } else {
            tabBar.frame.size.height = 70
            tabBar.frame.origin.y = view.frame.height - 50
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 20, vertical: -15)
        }
//
//        let numberOfItems = CGFloat(tabBar.items!.count)
//        let tabBarItemSize = CGSize(width: tabBar.frame.width/numberOfItems, height: tabBar.frame.height)
//        let color = UIColor.beeYellow
//
//        tabBar.selectionIndicatorImage = UIImage
//            .imageWithColor(color: color, size: tabBarItemSize)
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    //MARK: - Private Method
    private func initialSetting() {
        makeTabbar()
      
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .white
        let tbItemProxy = UITabBarItem.appearance()
        let selectedColor   = UIColor.beeBrown
        let unselectedColor = UIColor.rgb(170, 162, 157)
        
        tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor, NSAttributedString.Key.font: UIFont(name: "GodoM", size: 9.5) ?? UIFont.systemFont(ofSize: 9.5)], for: .normal)
        tbItemProxy.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor, NSAttributedString.Key.font: UIFont(name: "GodoM", size: 9.5) ?? UIFont.systemFont(ofSize: 9.5)], for: .selected)
        tbItemProxy.setBadgeTextAttributes([NSAttributedString.Key.font: UIFont(name: "GodoM", size: 7) ?? UIFont.systemFont(ofSize: 7)], for: .normal)
        tbItemProxy.badgeColor = .red

        navigationItem.hidesBackButton = true
        navigationItem.titleView = ciContainerView
        
      


        
//        locationManager.delegate = self
//        getCityList()
        
        
    }
    
    private func makeTabbar() {
        let tabFirst = UITabBarItem(title: "", image: MainTab.home.image.withRenderingMode(.alwaysOriginal), selectedImage: MainTab.home.imageSelect.withRenderingMode(.alwaysOriginal))
        let tabSecond = UITabBarItem(title: "", image: MainTab.search.image.withRenderingMode(.alwaysOriginal), selectedImage: MainTab.search.imageSelect.withRenderingMode(.alwaysOriginal))
        let tabThird = UITabBarItem(title: "", image: MainTab.use.image.withRenderingMode(.alwaysOriginal), selectedImage: MainTab.use.imageSelect.withRenderingMode(.alwaysOriginal))
        let tabFourth = UITabBarItem(title: "", image: MainTab.ticket.image.withRenderingMode(.alwaysOriginal), selectedImage: MainTab.ticket.imageSelect.withRenderingMode(.alwaysOriginal))
        let tabFifth = UITabBarItem(title: "", image: MainTab.mypage.image.withRenderingMode(.alwaysOriginal), selectedImage: MainTab.mypage.imageSelect.withRenderingMode(.alwaysOriginal))

        
        tabFirst.tag = 0
        tabSecond.tag = 1
        tabThird.tag = 2
        tabFourth.tag = 3
        tabFifth.tag = 4
        
        homeVC.tabBarItem = tabFirst
        recentVC.tabBarItem = tabSecond
        homeVC.tabBarItem = tabThird
        homeVC.tabBarItem = tabFourth
        homeVC.tabBarItem = tabFifth
        
        self.viewControllers = [homeVC,recentVC]
        
    }
    
  
    
    private func setNavTitle(title: String) {
        
        let containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let ciImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "ci_new")
            imageView.frame = CGRect(x: 0, y: 0, width: 94, height: 16)
            return imageView
        }()
        
        let titleContainerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let navTitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = title
            label.textAlignment = .right
            label.font = .godo_B(14)
            label.textColor = .black
            label.numberOfLines = 2
            return label
        }()
        
        let navTitleImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "icoBottomArr")
            return imageView
        }()
        
        containerView.addSubview(ciImageView)
        containerView.addSubview(titleContainerView)
        titleContainerView.addSubview(navTitleLabel)
        titleContainerView.addSubview(navTitleImage)
        
        
        containerView.widthAnchor.constraint(equalToConstant: screen_width).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: navigationController?.navigationBar.frame.height ?? 48).isActive = true
        
        ciImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        ciImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        ciImageView.widthAnchor.constraint(equalToConstant: 98).isActive = true
        ciImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        titleContainerView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        titleContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        titleContainerView.leadingAnchor.constraint(equalTo: ciImageView.trailingAnchor).isActive = true
        titleContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        navTitleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor).isActive = true
        navTitleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor, constant: 20).isActive = true
        navTitleLabel.trailingAnchor.constraint(equalTo: navTitleImage.leadingAnchor, constant: -10).isActive = true
        
        navTitleImage.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor).isActive = true
        navTitleImage.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor, constant: -30).isActive = true
        navTitleImage.widthAnchor.constraint(equalToConstant: screen_width == 375 ? 8:16).isActive = true
        navTitleImage.heightAnchor.constraint(equalToConstant: screen_width == 375 ? 4:8).isActive = true
        
       
        
        navigationItem.titleView = containerView
        
    }
    
    func setIndex(index: Int) {
        
        let title = BaseLabel()
        title.configure(font: .godo_B(16), color: .black)
        if index == 0 {
            title.text = "Recipes"
            navigationItem.titleView = title
            navigationItem.rightBarButtonItem = nil
        }else {
            title.text = "Recent"
            navigationItem.titleView = title
            navigationItem.rightBarButtonItem = nil
        }
 
    }
    
    
    // MARK: - Internal Method
    func currentLocation() {
        
    }
    
    func updateNavTitle(title: String) {
        setNavTitle(title: title)
    }
    
    func updateNavTitle(latitude: Double, longitude: Double) {
       
       
        
    }
    
    // MARK: - Network
  
}

//MARK: - UITabBarControllerDelegate
extension MainViewController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let tabViewControllers = tabBarController.viewControllers, let toIndex = tabViewControllers.firstIndex(of: viewController) else {
            return false
        }
        
        animateToTab(toIndex: toIndex)
        setIndex(index: toIndex)

        return true
    }
        
    func animateToTab(toIndex: Int) {
        guard let tabViewControllers = viewControllers,
            let selectedVC = selectedViewController else { return }
        
        guard let fromView = selectedVC.view,
            let toView = tabViewControllers[toIndex].view,
            let fromIndex = tabViewControllers.firstIndex(of: selectedVC),
            fromIndex != toIndex else { return }
        
        
        // Add the toView to the tab bar view
        fromView.superview?.addSubview(toView)
        
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        // Slide the views by -offset
                        fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                        toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
                        
        }, completion: { finished in
            // Remove the old view from the tabbar view.
            fromView.removeFromSuperview()
            self.selectedIndex = toIndex
            self.view.isUserInteractionEnabled = true
        })
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tabViewControllers = tabBarController.viewControllers, let idx = tabViewControllers.firstIndex(of: viewController) else {return}
        
        setIndex(index: idx)

    }
    

}

