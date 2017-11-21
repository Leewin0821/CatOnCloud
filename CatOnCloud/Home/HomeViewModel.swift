//
//  HomeViewModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 25/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    let momentService = MomentService()
    
    var homeModels: [HomeCellModel] = []
    
    init() {
        momentService.retrieveMoment(success: momentSuccess, failure: momentFail)
    }
    
    var count: Int {
        get {
            return homeModels.count
        }
    }
    
    func getCellViewModel(index: Int) -> HomeCellViewModel {
        return HomeCellViewModel(model: homeModels[index])
    }
    
    func momentSuccess(homeModels: [HomeCellModel]) {
        self.homeModels = homeModels
    }
    
    func momentFail(err: APIError) {
        print(err.message)
    }
    
    
}
