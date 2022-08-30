//
//  BundleExtension.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/16.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//


import UIKit

extension Bundle {
    static var localizedBundle: Bundle {
        let languageCode = Language.language.rawValue
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
            return Bundle.main
        }
        return Bundle(path: path)!
    }
}
