//
//  Respository.swift
//  DemoMVVM
//
//  Created by Apple on 05/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class Respository
{
    var name : String!
    var detail : String?
    
    init?(_ dic : [String : Any]) {
        guard let name = dic["full_name"] else{
            return nil
        }
        self.name = name as! String
        
        if let detail = dic["description"] as? String{
            self.detail = detail
        }
    }
}
