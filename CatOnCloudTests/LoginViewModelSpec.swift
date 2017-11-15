//
//  LoginViewModelSpec.swift
//  CatOnCloudTests
//
//  Created by Liwen Zhang on 18/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//
import Quick
import Nimble
@testable import CatOnCloud

class LoginViewModelSpec: QuickSpec {
    override func spec() {
        describe("login logic") {
            var loginViewModel : LoginViewModel!
            beforeEach {
                loginViewModel = LoginViewModel()
                
            }
            it ("should login", closure: {
                let username = "awe"
                let password = "some"
                let result = loginViewModel.login(name: username, pwd: password)
                expect(result).to(equal(true))
            })
            it ("should failed", closure: {
                let username = "foo"
                let password = "bar"
                let result = loginViewModel.login(name: username, pwd: password)
                expect(result).to(equal(false))
            })
        }
    }
}

