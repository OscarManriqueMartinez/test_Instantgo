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
    
    func doRegister(user: String, password: String, repeatPass: String)
}


class RegisterInteractor: RegisterInteractorInputProtocol {
    
    // MARK: Properties
    
    private weak var presenter: RegisterInteractorOutputProtocol?
    private var dataManager: RegisterDataManagerProtocol
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: RegisterDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: RegisterInteractorInputProtocol
    
    func set(presenter: RegisterInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func doRegister(user: String, password: String, repeatPass: String) {
        
        if user == "" || password == "" || repeatPass == "" {
            presenter?.show(error: BaseError.empty)
            return
        }
        
        if !user.isValidEmail() {
            presenter?.show(error: BaseError.invalidEmail)
            return
        }
        
        if !password.isValidPassword() || !repeatPass.isValidPassword() {
            presenter?.show(error: BaseError.invalidPass)
            return
        }
        
        if repeatPass != password {
            presenter?.show(error: BaseError.diferentPass)
            return
        }
        
        dataManager.register(user: user, password: password, success: {
            
            self.presenter?.showRegisterSuccess()
            
        }, failure: { error in
            self.presenter?.show(error: error)
        })
    }
}
