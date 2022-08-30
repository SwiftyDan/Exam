//
//  BaseViewController.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit
import Foundation
class BaseViewController: UIViewController {
 
    // MARK: - Properties
    var statusBarStyle: UIStatusBarStyle {
        if #available(iOS 13, *) {
            return UIStatusBarStyle.default
        } else {
            return UIStatusBarStyle.default
        }
    }
    var navigation: BaseNavigationController {
        return navigationController as! BaseNavigationController
    }
    private var barTintColor: UIColor? = nil
    private var barImage: UIImage? = nil
    private var titleView: UIView? = nil
    private var isTranslucent = false
    private var vSpinner: UIView?
    
    
    // MARK: - UI Component
    
    private let ciImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ci_new")
        return imageView
    }()
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.delegate = self
        
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
        view.backgroundColor = .rgb(245)
        hideKeyboardWhenTappedAround()
        self.barTintColor = .beeYellow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigation.statusBarStyle = statusBarStyle
        updateNavigationBar()
        
    }
    func showAlertMessage(alerttitle: String, alertmessage: String) {
        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    // MARK: - Internal Method
    func setNavigationBar(isUnderline: Bool, barTintColor: UIColor? = nil, title: String? = nil) {
        if #available(iOS 13.0, *) {
            UINavigationBarAppearance().shadowColor = .rgb(220,181,0)
        } else {
            // Fallback on earlier versions
        }
        self.barTintColor = .beeYellow
       // self.barImage = isUnderline ? nil:UIImage()
        self.titleView = initNaviTitle(titleName: title)
        self.isTranslucent = !isUnderline
        updateNavigationBar()
    }
    
    func initNaviTitle (titleName: String?) -> UIView {
        let nTitle = UILabel()
        nTitle.font = .godo_B(16)
        nTitle.textAlignment = .center
        nTitle.textColor = .black
        nTitle.text = titleName
        nTitle.sizeToFit()
        nTitle.numberOfLines = 0
        nTitle.lineBreakMode = .byWordWrapping
        return nTitle
    }
    
    func setTitleView (view: UIView? = nil) {
        if view == nil {
            self.titleView = ciImageView
            self.navigationItem.titleView = titleView
        } else {
            self.titleView = view
            self.navigationItem.titleView = titleView
        }
        
    }
    
    func showBackButton() {
        let backButton = BaseButton()
        backButton.image(normal: "icoBack")
        backButton.title("       ", color: .clear, size: 25)
        backButton.alignHorizontal()
        backButton.addTarget(self, action: #selector(didClickBackButton), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func setViewTapGestureEnabled(_ isTap: Bool) {
        guard isTap else {
            if let recognizers = view.gestureRecognizers {
                for recognizer in recognizers {
                    if recognizer.isKind(of: UITapGestureRecognizer.self) {
                        view.removeGestureRecognizer(recognizer)
                        break
                    }
                }
            }
            return
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai: UIActivityIndicatorView?
        
        if #available(iOS 13.0, *) {
            ai = UIActivityIndicatorView.init(style: .large)
        } else {
            ai = UIActivityIndicatorView.init(style: .gray)
        }
        guard let indicator = ai else {return}
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    
    // MARK: - Private Method
    private func updateNavigationBar() {
        navigationController?.navigationBar.barTintColor = .beeYellow
        //navigationController?.navigationBar.setBackgroundImage(barImage, for: .default)
        navigationController?.navigationBar.shadowImage = barImage
        self.navigationItem.titleView = titleView
        navigationController?.navigationBar.isTranslucent = true
    }
    
    
    
    // MARK: - Selector
    @objc private func didClickBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapView() {
        view.endEditing(true)
    }
}

extension BaseViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension UIViewController {
    
    func showAlertMessageWHandler(alerttitle: String, alertmessage: String, completion: @escaping ((_ alert: UIAlertAction) -> ()),
            hascancelbtn: Bool = false, okbtnname:String = "OK", cancelbtnname:String = "Cancel", cancelcompletion: ((_ alert: UIAlertAction) -> ())? = nil) {
        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
        
        if hascancelbtn {
            ac.addAction(UIAlertAction(title: cancelbtnname, style: .cancel, handler: cancelcompletion))
        }
        
        ac.addAction(UIAlertAction(title: okbtnname, style: .default, handler: completion))
        present(ac, animated: true, completion: nil)
    }
    
}
// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let nav = self.navigationController as? BaseNavigationController, gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer else {
            return true // default value
        }
        // Disable pop gesture in two situations:
        // 1) when the pop animation is in progress
        // 2) when user swipes quickly a couple of times and animations don't have time to be performed
        
        if (nav.visibleViewController?.isKind(of: MainViewController.self))! {
            return false
        }

        let count = nav.viewControllers.count
        let during = nav.duringPushAnimation
        
//        return count > 2 && during == false
        return count > 2
        
        
    }
}

// MARK: - UINavigationControllerDelegate

extension BaseViewController: UINavigationControllerDelegate {
    

    
}



//extension UIViewController {
//
//
//    @objc func keyboardWillShow(notification: NSNotification) {
//
//        guard let userInfo = notification.userInfo else {return}
//        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
//        let keyboardFrame = keyboardSize.cgRectValue
//
//        if self.view.frame.origin.y == 0 {
//            self.view.frame.origin.y -= keyboardFrame.height
//
//            self.view.contentMode = .bottomLeft
//        } else {
//            self.view.frame.origin.y = 0 - keyboardFrame.height
//        }
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.view.frame.origin.y != 0{
//            self.view.frame.origin.y = 0
//        }
//    }
//
//    //FIRE A TOAST MESSAGE
//    func showToast(message : String, toastwidth: CGFloat) {
//
//        DispatchQueue.main.async {
//
//            let toastLabel = UILabel(frame: CGRect(x: 10, y: 10, width: toastwidth-20, height: 35))
//            toastLabel.backgroundColor = UIColor.clear
//            toastLabel.textColor = UIColor.white
//            toastLabel.textAlignment = .center;
//            toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
//            toastLabel.lineBreakMode = .byWordWrapping
//            toastLabel.numberOfLines = 0
//            toastLabel.text = message
//            toastLabel.alpha = 1.0
//            toastLabel.clipsToBounds  =  true
//            toastLabel.sizeToFit()
//
//            let toastView = UIView(frame: CGRect(x: self.view.frame.size.width/2 - toastwidth/2, y: self.view.frame.size.height-(toastLabel.frame.height+50+self.view.layoutMargins.bottom), width: toastwidth, height: toastLabel.frame.height+20))
//
//            //toastLabel.center.x = toastView.center.x
//
//            toastView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//            toastView.addSubview(toastLabel)
//            toastView.layer.cornerRadius = 10;
//
//
//            self.view.addSubview(toastView)
//            UIView.animate(withDuration: 7.0, delay: 1.0, options: .curveEaseOut, animations: {
//                toastView.alpha = 0.0
//            }, completion: {(isCompleted) in
//                toastView.removeFromSuperview()
//            })
//        }
//    }
//
//    func showToastError(message : String, toastwidth: CGFloat, position: CGFloat) {
//
//        DispatchQueue.main.async {
//
//            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - toastwidth/2, y: 17.5, width: toastwidth, height: 55))
//            toastLabel.backgroundColor = UIColor.white
//            toastLabel.textColor = UIColor.black
//            toastLabel.text = message
//            toastLabel.textAlignment = .center;
//            toastLabel.font = UIFont(name: "Montserrat-Light", size: 14.0)
//            toastLabel.lineBreakMode = .byWordWrapping
//            toastLabel.numberOfLines = 0
//            toastLabel.clipsToBounds = false
//            toastLabel.sizeToFit()
//
//            let toastView = UIView(frame: CGRect(x: self.view.frame.size.width/2 - toastwidth/2,
//                                                 y: position,
//                                                 width: toastwidth, height: toastLabel.frame.height + 35))
//            toastView.alpha = 0.9
//            toastView.backgroundColor = UIColor.white
//            toastView.addSubview(toastLabel)
//            toastView.layer.shadowOpacity = 0.5
//            toastView.layer.shadowOffset = CGSize(width: 2, height: 2)
//            toastView.layer.shadowRadius = 5.0
//            toastView.layer.shadowColor = UIColor.darkGray.cgColor
//            toastView.layer.cornerRadius = 5;
//
//            self.view.addSubview(toastView)
//            UIView.animate(withDuration: 4.3, delay: 1.0, options: .curveEaseOut, animations: {
//                toastView.alpha = 0.0
//            }, completion: {(isCompleted) in
//                toastView.removeFromSuperview()
//            })
//        }
//    }
//
//    //SHOWS ALERT MESSAGE
//    func showAlertMessage(alerttitle: String, alertmessage: String) {
//        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(ac, animated: true, completion: nil)
//    }
//
//    func showDialogMessage(alerttitle: String, alertmessage: String, completion: @escaping ((_ alert: UIAlertAction) -> ()), okbtnname: String) {
//        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
//
//        ac.addAction(UIAlertAction(title: okbtnname, style: .default, handler: completion))
//        present(ac, animated: true, completion: nil)
//    }
//
//    func showAlertProceedWHandler(alerttitle: String, alertmessage: String, completion: @escaping ((_ alert: UIAlertAction) -> ()),
//            hascancelbtn: Bool = false, okbtnname:String = "OK", cancelbtnname:String = "Cancel", cancelcompletion: ((_ alert: UIAlertAction) -> ())? = nil) {
//        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
//
//        if hascancelbtn {
//            ac.addAction(UIAlertAction(title: cancelbtnname, style: .default, handler: cancelcompletion))
//        }
//
//        ac.addAction(UIAlertAction(title: okbtnname, style: .cancel, handler: completion))
//        present(ac, animated: true, completion: nil)
//    }
//
//
//    func showAlertMessageWHandler(alerttitle: String, alertmessage: String, completion: @escaping ((_ alert: UIAlertAction) -> ()),
//            hascancelbtn: Bool = false, okbtnname:String = "OK", cancelbtnname:String = "Cancel", cancelcompletion: ((_ alert: UIAlertAction) -> ())? = nil) {
//        let ac = UIAlertController(title: alerttitle, message: alertmessage, preferredStyle: UIAlertController.Style.alert)
//
//        if hascancelbtn {
//            ac.addAction(UIAlertAction(title: cancelbtnname, style: .cancel, handler: cancelcompletion))
//        }
//
//        ac.addAction(UIAlertAction(title: okbtnname, style: .default, handler: completion))
//        present(ac, animated: true, completion: nil)
//    }
//
//}
