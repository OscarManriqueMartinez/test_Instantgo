//
//  LoginDataManager.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol LoginDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
}


class LoginDataManager: LoginDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: LoginAPIClientProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: LoginAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - LoginDataManagerProtocol
}






