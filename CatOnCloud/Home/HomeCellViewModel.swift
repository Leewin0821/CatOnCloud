//
//  HomeCellViewModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 25/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit
import Foundation

class HomeCellViewModel {
    var model: HomeCellModel
    
    init(model: HomeCellModel) {
        self.model = model
    }
    
    var cat: String {
        return model.cat
    }
    
    var message: String {
        return model.message
    }
    
    var time: String {
        return getTime()
    }
    
    func getTime() -> String {
        return "5 minuts later"
    }
    
    
}
