//
//  LoginNetworkManager.swift
//  DemoMVVM
//
//  Created by Apple on 05/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class LoginNetworkService {
    class func callFakeLoginService(completionHandler:@escaping (_ user : User) -> Void){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let user = User(name : "Gaurav")
            
            completionHandler(user)
        }
    }
}
