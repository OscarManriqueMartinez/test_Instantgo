//
//  RegisterInteractor.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol RegisterInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: RegisterInteractorOutputProtocol)
}


class RegisterInteractor: RegisterInteractorInputProtocol {
    
    // MARK: Properties
    
    private weak var presenter: RegisterInteractorOutputProtocol?
    private var dataManager: RegisterDataManagerProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: RegisterDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: RegisterInteractorInputProtocol
    
    func set(presenter: RegisterInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
}
