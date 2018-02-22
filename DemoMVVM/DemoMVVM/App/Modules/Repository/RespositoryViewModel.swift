//
//  RespositoryViewModel.swift
//  DemoMVVM
//
//  Created by Apple on 04/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

protocol RespositoryViewModelDelegate {
    func refreshView()
    func showError(_ errMsg : String)
}

public final class RespositoryViewModel{
    
    var delegate : RespositoryViewModelDelegate?
    var arrRepositoryData : Array<RepositoryCellViewModel> = []
    var userName : String{
        return self.user.name
    }
    
    private var user : User!
    private var repoService : RepositoryNetworkService!
    
    init(language : String, user : User) {
        self.user = user
        getRepositoryDetails(language)
    }
    
    func getRepositoryDetails(_ langauge :  String){
        repoService = RepositoryNetworkService()
        repoService.callRepositoryListService(langauge, completionHandler: { [weak self] (serviceResponse) in
            switch serviceResponse{
                case .success(let arrRepositories):
                    self?.arrRepositoryData = arrRepositories.flatMap(RepositoryCellViewModel.init)
                    self?.delegate?.refreshView()
                case .failure(let error):
                    let errMsg : String
                    switch error{
                        case .httpError(let httpErr):
                            switch httpErr{
                                case .jsonError:
                                errMsg = "Json Error"
                                
                                case .networkError:
                                errMsg = "Network Error"
                                
                                case .requestTimedOut:
                                errMsg = "Request Timed Out"
                            }
                        
                        case .repositoriesNotFound:
                            errMsg = "Repositories not found"
                    }
                    self?.delegate?.showError(errMsg)
            }
        })
    }
}

