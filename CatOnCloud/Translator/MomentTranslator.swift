//
//  MomentTranslator.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 20/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class MomentTranslator {
    func translate(data: Data) -> [MomentModel]? {
        let json = JSON(data);
        let arr = json["moments"].rawString()
        if let moments:[MomentModel] = Mapper<MomentModel>().mapArray(JSONString: arr!) {
            return moments
        } else {
            return []
        }
        
//        for (_, value) in dict {
//            images.append("http://localhost:8080/catnip" + value["image"].stringValue)
//        }
    }
}
