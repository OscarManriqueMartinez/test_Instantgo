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
}


class RegisterDataManager: RegisterDataManagerProtocol {
    
    // MARK: - Properties
    
    private var apiClient: RegisterAPIClientProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(apiClient: RegisterAPIClientProtocol) {
        
        self.apiClient = apiClient
    }
    
    
    // MARK: - RegisterDataManagerProtocol
}






