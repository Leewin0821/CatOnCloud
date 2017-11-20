//
//  MomentService.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 20/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class MomentService {
    private let urlSessionConfiguration = URLSessionConfiguration.default
    private let urlMoments = URL(string: "http://localhost:8080/catnip/moment/")!.absoluteURL
    private let apiErrorTranslator = APIErrorTranslator()
    private let momentTranslator = MomentTranslator()
    
    func retrieveMoment(success: @escaping ([HomeCellModel]) -> Void,
                        failure: @escaping (APIError) -> Void) {
        var request = URLRequest(url: urlMoments)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: urlSessionConfiguration)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let retrievedMoments = data.flatMap(self.momentTranslator.translate) {
                success(self.mapToHomeModel(momentModels: retrievedMoments))
            } else {
                let err = self.apiErrorTranslator.translate(data: data, error: error)
                failure(err)
            }
        }
        task.resume()
    }
    
    private func mapToHomeModel(momentModels: [MomentModel]) -> [HomeCellModel] {
        var viewModels: [HomeCellModel] = []
        
        for momentModel in momentModels {
            viewModels.append(HomeCellModel(
                cat: momentModel.cat ?? "",
                message: momentModel.message ?? "",
                timestamp: momentModel.timestamp ?? "",
                avatar: completeImageUrl(imagePath: momentModel.avatar?.image ?? ""),
                catImageOne: completeImageUrl(imagePath: momentModel.thumbs?[0].image ?? ""),
                catImageTwo: completeImageUrl(imagePath: momentModel.thumbs?[1].image ?? ""),
                catImageThree: completeImageUrl(imagePath: getLastImage(thumbs: momentModel.thumbs))
            ))
        }
        
        return viewModels
    }
    
    private func getLastImage(thumbs: [ImageModel]?) -> String {
        if (thumbs?.count == 3) {
            return thumbs![2].image
        } else {
            return ""
        }
    }
    
    private func completeImageUrl(imagePath: String) -> String {
        if imagePath.isEmpty {
            return ""
        }
        return "http://localhost:8080/catnip/" + imagePath
    }
}
