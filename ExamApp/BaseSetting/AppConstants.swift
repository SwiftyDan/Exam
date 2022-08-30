//
//  AppConstants.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit


let networkUrl = "https://jsonplaceholder.typicode.com/photos"


let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height
let status_height = UIApplication.shared.statusBarFrame.height

var keyWindoW: UIWindow {
    if #available(iOS 13, *) {
//        let keywindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        let keywindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        guard let window = keywindow else {return UIWindow()}
        return window
    } else {
        let keywindow = UIApplication.shared.keyWindow
        guard let window = keywindow else {return UIWindow()}
        return window
    }
}

func keyWindowAddSubview(_ view: UIView) {
    keyWindoW.addSubview(view)
}

func keyboardHeight(_ noti: NSNotification) -> CGFloat {
    
    if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        return keyboardHeight
    }

    return 0
}

func keyboardDuration(_ noti: NSNotification) -> Double {
    if let duration = noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
        return duration
    }
    
    return 0
}

