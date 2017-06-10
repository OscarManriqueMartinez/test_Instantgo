//
//  RegisterPresenter.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol RegisterPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func doRegister(user: String, password: String, repeatPass: String)
}

protocol RegisterInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func showRegisterSuccess()
    
}


class RegisterPresenter: BasePresenter, RegisterPresenterProtocol, RegisterInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: RegisterViewControllerProtocol?
    private var interactor: RegisterInteractorInputProtocol
    
    
    // MARK: - Object lifecycle
    
    init(view: RegisterViewControllerProtocol, interactor: RegisterInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
        super.init(baseView: view)
    }
    
    
    // MARK: - RegisterPresenterProtocol
    
    func doRegister(user: String, password: String, repeatPass: String) {
    
        interactor.doRegister(user: user, password: password, repeatPass: repeatPass)
    }
    
    
    // MARK: - RegisterInteractorOutputProtocol
    
    func showRegisterSuccess() {
        
        view?.showRegisterSuccess()
    }
}
