//
//  LoginInteractor.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol LoginInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: LoginInteractorOutputProtocol)
    
    func doLogin(user: String, password: String)
}


class LoginInteractor: LoginInteractorInputProtocol {
    
    // MARK: Properties
    
    private weak var presenter: LoginInteractorOutputProtocol?
    private var dataManager: LoginDataManagerProtocol
    
    
    // MARK: - Object lifecycle
    
    init(dataManager: LoginDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: - LoginInteractorInputProtocol
    
    func set(presenter: LoginInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func doLogin(user: String, password: String) {
        
        if user == "" || password == "" {
            presenter?.show(error: BaseError.empty)
            return
        }
        
        if !user.isValidEmail() {
            presenter?.show(error: BaseError.invalidEmail)
            return
        }
        
        if !password.isValidPassword() {
            presenter?.show(error: BaseError.invalidPass)
            return
        }
        
        dataManager.login(user: user, password: password, success: {
            
            
        }, failure: { error in
            self.presenter?.show(error: error)
        })
    }
}
