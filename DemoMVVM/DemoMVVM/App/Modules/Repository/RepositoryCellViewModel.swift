//
//  RepositoryCellViewModel.swift
//  DemoMVVM
//
//  Created by Apple on 07/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class RepositoryCellViewModel {
    
    var name : String{
        return repository.name ?? ""
    }
    
    var detail : String{
        return repository.detail ?? ""
    }
    
    private var repository : Respository!
    
    init(_ repository : Respository) {
        self.repository = repository
    }
    
}
