//
//  HomeService.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 8/29/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class HomeService {
    func getSearchResultMart(searchText:String, completion: @escaping ([Recipe]?, String?, Error?) -> Void) {
        let param : Parameters = [
            "q" : searchText
            
        ]
        let loginHeaders: HTTPHeaders = ["Accept-Language" : getLanguage()]
    
        
        Alamofire.request(networkUrl+searchText, method: .get, encoding: URLEncoding.httpBody).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                

                
                let data = json["recipes"].array?.map{Recipe($0)}
                
                completion(data, nil, nil)
                
            case .failure(let error):
             
                completion(nil, nil, error)
            }
        }
    }
    func getRecipes(q: String,completion: @escaping ([Recipe]?, Error?) -> Void) {
     
        Alamofire.request(networkUrl+q, method: .get, encoding: URLEncoding.httpBody).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
           
                let data = json["recipes"].array?.map{Recipe($0)}
               
                completion(data, nil)
                
            case .failure(let error):
               
                completion(nil, error)
            }
        }
    }
    
}
