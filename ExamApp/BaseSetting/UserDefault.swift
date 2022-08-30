//
//  UserDefault.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import Foundation
import SwiftyJSON

var fCMTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukFCMToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukFCMToken)
        ud.synchronize()
    }
}

var deviceTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukDeviceToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukDeviceToken)
        ud.synchronize()
    }
}
var kakaoTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukKakaoToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukKakaoToken)
        ud.synchronize()
    }
}

var googleTokenx1: String? {
    get {
        return UserDefaults.standard.string(forKey: ukGoogleToken2)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukGoogleToken2)
        ud.synchronize()
    }
}

var googleTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukGoogleToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukGoogleToken)
        ud.synchronize()
    }
}

var facebookTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukFacebookToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukFacebookToken)
        ud.synchronize()
    }
}

var appleTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukAppleToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukAppleToken)
        ud.synchronize()
    }
}

var memIdx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukMemId)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukMemId)
        ud.synchronize()
    }
}

var passwordx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukPassword)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukPassword)
        ud.synchronize()
    }
}

var mkeyx: Int? {
    get {
        return UserDefaults.standard.integer(forKey: ukMkey)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukMkey)
        ud.synchronize()
    }
}

var nickx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukNick)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukNick)
        ud.synchronize()
    }
}

var isLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukIsLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukIsLogin)
        ud.synchronize()
    }
}
var isKakaoLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukIsKakaoLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukIsKakaoLogin)
        ud.synchronize()
    }
}
var isGoogleLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukIsGoogleLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukIsGoogleLogin)
        ud.synchronize()
    }
}
var isFacebookLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukIsFacebookLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukIsFacebookLogin)
        ud.synchronize()
    }
}
var isAppleLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukIsAppleLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukIsAppleLogin)
        ud.synchronize()
    }
}
var isAutoLoginx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukAutoLogin)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukAutoLogin)
        ud.synchronize()
    }
}
var languagex: String? {
    get {
        return UserDefaults.standard.string(forKey: ukLanguage)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLanguage)
        ud.synchronize()
    }
}

var languageSettingx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukLanguageSetting)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLanguageSetting)
        ud.synchronize()
    }
}

var alertSettingx: Bool {
    get {
        return UserDefaults.standard.bool(forKey: ukAlertSetting)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukAlertSetting)
        ud.synchronize()
    }
}

var selectedCompKeyx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukSelectedCompKey)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukSelectedCompKey)
        ud.synchronize()
    }
}

var selectedCompNamex: String? {
    get {
        return UserDefaults.standard.string(forKey: ukSelectedCompName)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukSelectedCompName)
        ud.synchronize()
    }
}





//var googleTokenx1: String? {
//    get {
//        return UserDefaults.standard.string(forKey: ukGoogleToken2)
//    }
//    set(v) {
//        let ud = UserDefaults.standard
//        ud.set(v, forKey: ukGoogleToken2)
//        ud.synchronize()
//    }
//}



var selectedCompKeyMartx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukSelectedCompKeyMart)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukSelectedCompKeyMart)
        ud.synchronize()
    }
}

var selectedCompNameMartx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukSelectedCompNameMart)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukSelectedCompNameMart)
        ud.synchronize()
    }
}



var recentSearchWordx: [String]? {
    get {
        return UserDefaults.standard.stringArray(forKey: ukRecentSearchWord)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukRecentSearchWord)
        ud.synchronize()
    }

}

var lodgementRecentSearchWordx: [String]? {
    get {
        return UserDefaults.standard.stringArray(forKey: ukLodgementRecentSearchWord)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLodgementRecentSearchWord)
        ud.synchronize()
    }

}

var mainPopUpCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukMainPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukMainPopUPCloseDate)
        ud.synchronize()
    }

}

var lodgementPopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukLodgementPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLodgementPopUPCloseDate)
        ud.synchronize()
    }

}

var massagePopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukMassagePopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukMassagePopUPCloseDate)
        ud.synchronize()
    }
}

var martPopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukMartPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukMartPopUPCloseDate)
        ud.synchronize()
    }

}

var deliveryPopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukDeliveryPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukDeliveryPopUPCloseDate)
        ud.synchronize()
    }
}

var realtyPopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukRealtyPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukRealtyPopUPCloseDate)
        ud.synchronize()
    }
}

var localPopUPCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukLocalPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLocalPopUPCloseDate)
        ud.synchronize()
    }
}

var usedPopUpCloseDatex: Date? {
    get {
        return UserDefaults.standard.object(forKey: ukUsedPopUPCloseDate) as? Date
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukUsedPopUPCloseDate)
        ud.synchronize()
    }

}


var loginTokenx: String? {
    get {
        return UserDefaults.standard.string(forKey: ukLoginToken)
    }
    set(v) {
        let ud = UserDefaults.standard
        ud.set(v, forKey: ukLoginToken)
        ud.synchronize()
    }
}


func getFCMToken() -> String {
    guard let token = fCMTokenx else{return "No token value."}
    return token
}
func getDeviceToken() -> String {
    guard let token = deviceTokenx else{return "No token value."}
    return token
}
func getMemIdx() -> String {
    guard let memberId = memIdx else{return "No member ID."}
    return memberId
}
func getPassword() -> String {
    guard let pw = passwordx else{return "No password."}
    return pw
}
func getMkey() -> String {
    guard let mkey = mkeyx else{return "0"}
    let mkeyStr = String(describing: mkey)
    return mkeyStr
}
func getLanguage() -> String {
    guard let language = languagex else {return "EN"}
    return language
}
func getLoginToken() -> String {
    guard let token = loginTokenx else {return "No login token."}
    return token
}
