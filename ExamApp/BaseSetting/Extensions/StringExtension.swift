//
//  StringExtension.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/14.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import Foundation

extension String {
     var localized: String {
           return Bundle.localizedBundle.localizedString(forKey: self, value: nil, table: nil)
//           return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    
        
    }
    
    
    var formattedNumberString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0

        if formatter.number(from: self) != nil {
            if let formattedNumber = formatter.number(from: self), let formattedString = formatter.string(from: formattedNumber) {
                return formattedString
            }
        } else {
            return self
        }
        return self
    }
    
    public func trimHTMLTags() -> String? {
        guard let htmlStringData = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        let attributedString = try? NSAttributedString(data: htmlStringData, options: options, documentAttributes: nil)
        
        let raw = attributedString?.string
        let stripped = raw?.replacingOccurrences(of: "\u{ef}", with: "", options: String.CompareOptions.literal, range:nil)
        let stripped2 =  stripped?.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        let stripped3 =  stripped2?.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
        if stripped3 == "" {
            return " "
        } else {
            return stripped3
        }
    }
}

