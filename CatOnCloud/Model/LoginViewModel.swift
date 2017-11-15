//
//  LoginViewModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import Foundation

class LoginViewModel {
    var loginError: APIError?
    
    var loginErrorMsg: String? {
        return loginError?.message
    }
    
    func login(name:String, pwd:String) -> Bool {
        if name == "awe" && pwd == "some" {
            return true
        } else {
            return false
        }
    }
}
