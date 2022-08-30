//
//  File.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/16.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

enum Language: String {
    
    case english = "en"
    case korean = "ko"
    case chinese = "zh-Hans"
    

    static var language: Language {
        get {
            if let languageCode = languagex, let language = Language(rawValue: languageCode) {
                return language
            } else {
                let preferredLanguage = NSLocale.preferredLanguages[0] as String
                let index = preferredLanguage.index(
                    preferredLanguage.startIndex,
                    offsetBy: 2
                )
                guard let localization = Language(
                    rawValue: String(preferredLanguage[..<index])
                    ) else {
                        return Language.english
                }
                
                return localization
            }
        }
        set {
            guard language != newValue else {
                return
            }

            languagex = newValue.rawValue
            
        }
    }
}

enum BirthSelect: String {
    case year, month, day
    
    var value: Array<String> {
        get {
            switch self {
                
            case .year:
                var picker = [String]()
                for i in 1930...2020 {
                    picker.append(String(i))
                }
                picker.reverse()
                return picker
            case .month:
                var picker = [String]()
                for i in 1...12 {
                    picker.append(String(i))
                }
                return picker
            case .day:
                var picker = [String]()
                for i in 1...31 {
                    picker.append(String(i))
                }
                return picker
            }
        }
    }
}

enum MainTab: CaseIterable {
    case home
    case ticket
    case search
    case use
    case mypage
    
    var title: String {
        switch self {
        case .home:
            return "MainTab.Home".localized
        case .search:
            return "MainTab.Search".localized
        case .ticket:
            return "MainTab.Search".localized
        case .use:
            return "MainTab.Usage".localized
        case .mypage:
            return "MainTab.MyPage".localized
        }
    }
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named: "home")!
        case .search:
            return UIImage(named: "home")!
        case .ticket:
            return UIImage(named: "home")!
        case .use:
            return UIImage(named: "home")!
        case .mypage:
            return UIImage(named: "home")!
        }
    }
    var imageSelect: UIImage {
        switch self {
        case .home:
            return UIImage(named: "Home-fill")!
        case .search:
            return UIImage(named: "Home-fill")!
        case .ticket:
            return UIImage(named: "Home-fill")!
        case .use:
            return UIImage(named: "Home-fill")!
        case .mypage:
            return UIImage(named: "Home-fill")!
        }
    }
    
}


enum CompSelect: String {
    case compName, compKey
    
    var value: Array<String> {
        get {
            switch self {
                
            case .compName:
                let picker = ["PartnerCategory.01".localized,
                              "PartnerCategory.02".localized,
                              "PartnerCategory.03".localized,
                              "PartnerCategory.04".localized,
                              "PartnerCategory.05".localized,
                              "PartnerCategory.06".localized,
                              "PartnerCategory.07".localized,
                              "PartnerCategory.08".localized]
                return picker

            case .compKey:
                let picker = ["10", "20", "30", "40", "50", "60", "70", "99"]
                return picker
            }
        }
    }
}
