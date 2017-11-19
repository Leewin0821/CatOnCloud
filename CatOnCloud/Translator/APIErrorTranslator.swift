//
//  APIErrorTranslator.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 01/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class APIErrorTranslator {
    func translate(data: Data?, error: Error?) -> APIError {
        let message = data.flatMap(translateErrorMessage) ?? error?.localizedDescription ?? "Uknown error"
        return APIError(message: message)
    }
    
    private func translateErrorMessage(data: Data) -> String? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        let dict = dataJson as? [String: Any]
        return dict?["message"] as? String
        
    }
}
