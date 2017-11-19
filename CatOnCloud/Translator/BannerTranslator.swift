//
//  BannerTranslator.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation
import SwiftyJSON

class BannerTranslator {
    func translate(data: Data) -> [String]? {
        var images:[String] = []
        let json = JSON(data);
        let dict = json["banners"]
        for (_, value) in dict {
            images.append("http://localhost:8080/catnip" + value["image"].stringValue)
        }
        return images
    }
}
