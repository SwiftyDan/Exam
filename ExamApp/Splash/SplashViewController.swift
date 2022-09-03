//
//  SplashViewController.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit


class SplashViewController: BaseViewController {
    // MARK: - Properties
    var versionCheck = false
    
    // MARK: - UI Component
    
    private let ciImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "home")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
 
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var arguments = ProcessInfo.processInfo.arguments
        arguments.removeFirst()

        initialSetting()
        view.addSubview(ciImageView)
        layout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
      
               self.showStartViewController()

  

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        setNavigationBar(isUnderline: true, barTintColor: .beeYellow)
        setStatusBar(color: .beeYellow)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    // MARK: - Private Method
    private func initialSetting() {

        view.backgroundColor = .clear
        
    }
    
    private func showMainViewController() {

    }


    private func showStartViewController() {
 
            let vc = MainViewController()
            show(vc)
            return
        }
        
    // MARK: - Network
 
    
    
    
    //MARK: - Layout
    private func layout() {
        ciImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        ciImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        ciImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ciImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

