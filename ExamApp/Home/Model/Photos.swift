//
//  Photos.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 8/29/22.
//

import SwiftyJSON

class Photos {
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
  
    
    init(_ json: JSON) {
        title = json["title"].string
        url = json["url"].string
        thumbnailUrl = json["thumbnailUrl"].string
        id = json["id"].int
        
    }
}
