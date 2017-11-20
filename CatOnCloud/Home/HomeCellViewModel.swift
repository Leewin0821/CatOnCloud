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
    
    var avatar: UIImage {
        return retrieveImage(imageUrl: model.avatar)
    }
    
    var catImageOne: UIImage {
        return retrieveImage(imageUrl: model.catImageOne)
    }
    
    var catImageTwo: UIImage {
        return retrieveImage(imageUrl: model.catImageTwo)
    }
    
    var catImageThree: UIImage {
        return retrieveImage(imageUrl: model.catImageThree)
    }
    
    
    func getTime() -> String {
        let dateFormater : DateFormatter = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let timeStamp = dateFormater.date(from: model.timestamp)
        let current = Date()
        
        return stringFromTime(fromDate: timeStamp ?? current, endDate: current)
     
    }
    
    func stringFromTime(fromDate: Date, endDate: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute]
        return formatter.string(from: fromDate, to: endDate)! + " minutes ago"
    }
    
    func retrieveImage( imageUrl: String) -> UIImage {
        if imageUrl.isEmpty {
            return UIImage()
        }
        return NSURL(string: imageUrl)
            .flatMap { $0 }
            .flatMap { NSData(contentsOf: $0 as URL) }
            .flatMap { UIImage(data: $0 as Data)}!
    }
    
}
