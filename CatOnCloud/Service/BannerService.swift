//
//  BannerService.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class BannerService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlBanners = URL(string: "http://localhost:8080/catnip/appearance/")!.absoluteURL
    private let apiErrorTranslator = APIErrorTranslator()
    private let bannerTranslator = BannerTranslator()
    
    func retrieveBanner(success: @escaping ([String]) -> Void,
                        failure: @escaping (APIError) -> Void) {
        var request = URLRequest(url: urlBanners)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let images = data.flatMap(self.bannerTranslator.translate) {
                success(images)
            } else {
                let err = self.apiErrorTranslator.translate(data: data, error: error)
                failure(err)
            }
        }
        task.resume()
    }
}
