//
//  RegisterAPIClient.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import FirebaseAuth


protocol RegisterAPIClientProtocol: class {
    
    /**
     * Add here your methods for communication DATA_MANAGER -> API_CLIENT
     */
    
    func register(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void)
}


class RegisterAPIClient: RegisterAPIClientProtocol {
    
    // MARK: - RegisterAPIClientProtocol
    
    func register(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void) {
        
        Auth.auth().createUser(withEmail: user, password: password) { (user, error) in
            
            if error != nil {
                failure(BaseError.generic)
                
            } else {
                success()
            }
        }
    }
}






