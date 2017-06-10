//
//  RegisterDataManager.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol RegisterDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
    
    func register(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void)
}


class RegisterDataManager: RegisterDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: RegisterAPIClientProtocol
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: RegisterAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - RegisterDataManagerProtocol
    
    func register(user: String, password: String, success: @escaping (Void) -> Void, failure: @escaping (BaseError) -> Void) {
     
        apiClient.register(user: user, password: password, success: success, failure: failure)
    }
}






