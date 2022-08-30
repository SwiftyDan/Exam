//
//  File.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func show(_ viewController: UIViewController) {
        show(viewController, sender: nil)
    }
    

    func modalShow(_ viewController: UIViewController, completion: @escaping()->Void) {
        viewController.modalPresentationStyle = .formSheet
        if #available(iOS 13.0, *) {
            viewController.isModalInPresentation = true
        } else {
            viewController.view.gestureRecognizers?.first?.isEnabled = false
        }
        present(viewController, animated: true, completion: completion)
    }
    
    func setStatusBar(color: UIColor) {
        if #available(iOS 13.0, *) {
            
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBar = UIView(frame: window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
//            statusBar.backgroundColor = color
//            window?.addSubview(statusBar)
            if color == .clear {
                statusBar.backgroundColor = UIColor.white.withAlphaComponent(0.0)
            } else {
                statusBar.backgroundColor = color
                window?.addSubview(statusBar)
            }


            
        } else {
           UIApplication.shared.statusBarView?.backgroundColor = color
           UIApplication.shared.statusBarStyle = .default
        }
    }
    
    func alert (_ message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
                DispatchQueue.main.async {
                    completion?()
                }
            }
            alert.addAction(okAction)
            self.present(alert, animated: false)
        }
    }
    
    func selectAlert (_ message: String, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive) { (_) in
                completion?()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: false)
        }
    }
    
    

    
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
      let data = try JSONEncoder().encode(self)
      guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
        throw NSError()
      }
      return dictionary
    }
}
