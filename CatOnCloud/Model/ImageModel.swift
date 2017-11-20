//
//  ImageModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImageModel: Mappable {
    var image: String
    
    init(image: String) {
        self.image = image
    }
    
    init(map: Map) {
        self.image = ""
    }
    
    mutating func mapping(map: Map) {
        image     <- map["image"]
    }
    
}
