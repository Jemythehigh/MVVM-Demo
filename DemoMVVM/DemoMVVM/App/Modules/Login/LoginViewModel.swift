//
//  LoginViewModel.swift
//  DemoMVVM
//
//  Created by Apple on 04/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

protocol LoginViewModelDelegate {
    func loginView_didLoginSuccess(_ repoVM : RespositoryViewModel)
    func loginView_didLoginFailed(_ errMsg : String)
}

public final class LoginViewModel
{
    //MARK:  Instance Properties
    var delegate : LoginViewModelDelegate?

    var username : String!
    var password : String!
    
    func login(){
        if username.count == 0{
            let errMsg = "Username cannot be empty"
            self.delegate?.loginView_didLoginFailed(errMsg)
        }else if password.count == 0{
            let errMsg = "Password cannot be empty"
            self.delegate?.loginView_didLoginFailed(errMsg)
        }else{
            LoginNetworkService.callFakeLoginService(completionHandler: { [weak self] (user) in
                let repositoryViewModel = RespositoryViewModel(language: "Swift", user: user)
                self?.delegate?.loginView_didLoginSuccess(repositoryViewModel)
            })
        }
    }
}
