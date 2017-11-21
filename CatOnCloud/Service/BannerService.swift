//
//  BannerService.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation
import Cache

class BannerService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlBanners = URL(string: "http://localhost:8080/catnip/appearance/")!.absoluteURL
    private let apiErrorTranslator = APIErrorTranslator()
    private let bannerTranslator = BannerTranslator()
    private let bannerKey = "banners"
    
    let storage = try? Storage(diskConfig: DiskConfig(name: "Floppy"), memoryConfig: MemoryConfig(
        expiry: .date(Date().addingTimeInterval(2*3600)),
        countLimit: 10,
        totalCostLimit: 10
    ))
    
    func retrieveBanner(success: @escaping ([String]) -> Void,
                        failure: @escaping (APIError) -> Void) {
        storage?.async.existsObject(ofType: [String].self, forKey: self.bannerKey) { result in
            if case .value(let exists) = result, exists {
                self.storage?.async.object(ofType: [String].self, forKey: self.bannerKey) { arr in
                    switch arr {
                    case .value(let images):
                        success(images)
                    case .error(let error):
                        print(error)
                    }
                }
            } else {
                var request = URLRequest(url: self.urlBanners)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Accept")
                
                let session = URLSession(configuration: self.urlSessionConfiguration)
                let task = session.dataTask(with: request) { (data, response, error) in
                    if let images = data.flatMap(self.bannerTranslator.translate) {
                        self.storage?.async.setObject(images, forKey: self.bannerKey) { result in
                            switch result {
                            case .value:
                                print("saved successfully")
                            case .error(let error):
                                print(error)
                            }
                        }
                        success(images)
                    } else {
                        let err = self.apiErrorTranslator.translate(data: data, error: error)
                        failure(err)
                    }
                }
                task.resume()
            }
        }
    }
}
