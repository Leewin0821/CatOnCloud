//
//  HomeViewModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 25/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

let cellModel = HomeCellModel(
    cat: "Tom",
    message: "Miao miao",
    timestamp: "2017-11-19T05:39:57.837Z",
    avatar: "http://localhost:8080/catnip/image/avatar1.jpg",
    catImageOne: "http://localhost:8080/catnip/image/thumb1.jpg",
    catImageTwo: "http://localhost:8080/catnip/image/thumb2.jpg",
    catImageThree: "http://localhost:8080/catnip/image/thumb3.jpg"
)

let mockModels = [cellModel, cellModel]

class HomeViewModel {
    
    let momentService = MomentService()
    
    var homeModels: [HomeCellModel] = []
    
    init() {
        momentService.retrieveMoment(success: momentSuccess, failure: momentFail)
    }
    
    
//    func getData(completion: ()-> Void {
//        homeModels = momentService.retrieveMoment()
//        completion()
//    })
    
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
