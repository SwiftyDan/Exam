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
    
    func getPhotos(completion: @escaping ([Photos]?, Error?) -> Void) {


        Alamofire.request(networkUrl, method: .get, encoding: URLEncoding.httpBody).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
              
     
                
                let data = json.array?.map{Photos($0)}
                print(data,"WTDASDSA")
                completion(data, nil)
                
            case .failure(let error):
               
                completion(nil, error)
            }
        }
    }
    
}
