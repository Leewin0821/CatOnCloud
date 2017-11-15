//
//  ViewController.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 11/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelErrorMsg: UILabel!
    
    private let loginViewModel = LoginViewModel()
    private let loginService = LoginService()
    
    var loginSuccessHandler: ((LoginKey) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelErrorMsg.text = loginViewModel.loginErrorMsg
    }
    
    @IBAction func signTouched(_ sender: Any) {
        if let username = textFieldUsername.text,
            let password = textFieldPassword.text {
            let credential = LoginCredential(username: username, password: password)
            loginService.performLogin(credential: credential, success: loginSuccess, failure: loginFailure)
        }
    }
    
    private func loginSuccess(loginKey: LoginKey) {
        loginSuccessHandler?(loginKey)
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        })
//        dismiss(animated: true, completion: nil)
    }
    
    private func loginFailure(error: APIError) {
        loginViewModel.loginError = error
        DispatchQueue.main.async {
            self.labelErrorMsg.text = self.loginViewModel.loginErrorMsg
        }
    }
    
    

    
}

