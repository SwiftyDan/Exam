//
//  Photos.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 8/29/22.
//

import SwiftyJSON

class Recipe {
   
    var publisher: String?
    var title: String?
    var source_url: String?
    var recipe_id: String?
    var image_url: String?
    var social_rank: Int?
    var publisher_url: String?
    
    init(_ json: JSON) {
 
        publisher = json["publisher"].string
        title = json["title"].string
        source_url = json["source_url"].string
        recipe_id = json["recipe_id"].string
        image_url = json["image_url"].string
        social_rank = json["social_rank"].int
        publisher_url = json["publisher_url"].string
        
    }
}
class SelectedMenu: NSObject, NSCoding {
    var publisher: String?
    var title: String?
    var source_url: String?
    var recipe_id: String?
    var image_url: String?
    var social_rank: Int?
    var publisher_url: String?

    init(_ json: JSON) {
        publisher = json["publisher"].string
        title = json["title"].string
        source_url = json["source_url"].string
        recipe_id = json["recipe_id"].string
        image_url = json["image_url"].string
        social_rank = json["social_rank"].int
        publisher_url = json["publisher_url"].string
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(publisher, forKey: "publisher")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(source_url, forKey: "source_url")
        aCoder.encode(recipe_id, forKey: "recipe_id")
        aCoder.encode(image_url, forKey: "image_url")
        aCoder.encode(social_rank, forKey: "social_rank")
        aCoder.encode(publisher_url, forKey: "publisher_url")
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        publisher = aDecoder.decodeObject(forKey: "publisher") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        source_url = aDecoder.decodeObject(forKey: "source_url") as? String
        recipe_id = aDecoder.decodeObject(forKey: "recipe_id") as? String
        image_url = aDecoder.decodeObject(forKey: "image_url") as? String
        social_rank = aDecoder.decodeObject(forKey: "social_rank") as? Int
        publisher_url = aDecoder.decodeObject(forKey: "publisher_url") as? String
      
    }
}
