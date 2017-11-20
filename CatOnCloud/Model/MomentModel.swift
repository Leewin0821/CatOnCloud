//
//  MomentModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 20/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation
import ObjectMapper

struct MomentModel: Mappable {
    var id: String?
    var cat: String?
    var avatar: ImageModel?
    var timestamp: String?
    var message: String?
    var thumbs: [ImageModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id     <- map["id"]
        cat     <- map["cat"]
        avatar     <- map["avatar"]
        timestamp     <- map["timestamp"]
        message     <- map["message"]
        thumbs     <- map["thumbs"]
    }
}
