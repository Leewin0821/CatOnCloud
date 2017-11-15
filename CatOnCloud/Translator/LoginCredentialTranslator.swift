//
//  LoginCredentialTranslator.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 01/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class LoginCredentialTranslator {
    func translate(credential: LoginCredential) -> Data {
        let dict = [
            "username": credential.username,
            "password": credential.password
        ]
        return try! JSONSerialization.data(withJSONObject: dict, options: [])
    }
}
