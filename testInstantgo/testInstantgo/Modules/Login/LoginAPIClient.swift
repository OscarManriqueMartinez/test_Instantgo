//
//  LoginAPIClient.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import FirebaseAuth

protocol LoginAPIClientProtocol: class {
    
    /**
     * Add here your methods for communication DATA_MANAGER -> API_CLIENT
     */
    
    func login(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void)
}


class LoginAPIClient: LoginAPIClientProtocol {
    
    // MARK: - LoginAPIClientProtocol
    
    
    func login(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void) {
        
        Auth.auth().signIn(withEmail: user, password: password) { (user, error) in
            
            if error != nil {
                failure(BaseError.invalidLogin)
            
            } else {
                success()
            }
        }
    }
}






