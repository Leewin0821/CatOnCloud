//
//  HomeViewModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 25/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

let cellModel = HomeCellModel(
    cat: "Tom", message: "Miao miao", timestamp: "2017-11-19T05:39:57.837Z"
)

let mockModels = [cellModel, cellModel]

class HomeViewModel {
    
    var homeModels: [HomeCellModel] = mockModels
    
    
//    func getData(completion: ()-> Void {
//        homeModels = mockModels
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
    
}
