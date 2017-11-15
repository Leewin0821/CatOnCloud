//
//  LoginKeyTranslator.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 01/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class LoginKeyTranslator {
    func translate(data: Data) -> LoginKey? {
        let dataJson = try? JSONSerialization.jsonObject(with: data, options: [])
        let dict = dataJson as? [String: Any]
        let key = dict?["key"] as? String
        return key.map(LoginKey.init)
    }
}
