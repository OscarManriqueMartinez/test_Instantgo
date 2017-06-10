//
//  BaseError.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation

enum BaseError: Error{
    case invalidEmail
    case invalidPass
    case diferentPass
    case generic
    case invalidLogin
    case empty
    
    
    func description() -> String {
        
        var description: String = ""
        
        switch self {
            case .invalidEmail: description =  "error.valid.email".localized
            case .invalidPass: description = "error.valid.pass".localized
            case .invalidLogin: description = "error.login".localized
            case .generic: description = "error.generic".localized
            case .diferentPass: description = "error.diferent.pass".localized
            case .empty: description = "error.field.empty".localized
        }
        
        return description
    }
}
