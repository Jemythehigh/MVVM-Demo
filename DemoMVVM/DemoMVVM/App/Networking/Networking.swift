//
//  Networking.swift
//  DemoMVVM
//
//  Created by Gaurav malviya on 07/02/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

enum ServiceResponse<T,error : Error> {
    case success(T)
    case failure(error)
}

enum HTTPError : Error {
    case requestTimedOut
    case networkError
    case jsonError
}

enum LoginError : Error{
    case httpError(HTTPError)
    case validationError
    case loginFailed
}

enum RepositoryError : Error {
    case httpError(HTTPError)
    case repositoriesNotFound
}
