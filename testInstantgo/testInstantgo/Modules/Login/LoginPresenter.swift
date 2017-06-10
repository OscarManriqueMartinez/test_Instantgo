//
//  LoginPresenter.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


protocol LoginPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func doLogin(user: String, password: String)
    
    func goToRegister()
}

protocol LoginInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
        
    func goToCalendar()
}


class LoginPresenter: BasePresenter, LoginPresenterProtocol, LoginInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: LoginViewControllerProtocol?
    private var interactor: LoginInteractorInputProtocol
    private var registerWireframe: RegisterWireframeProtocol
    
    
    // MARK: - Object lifecycle
    
    init(view: LoginViewControllerProtocol, interactor: LoginInteractorInputProtocol, registerWireframe: RegisterWireframeProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.registerWireframe = registerWireframe
        super.init(baseView: view)
    }
    
    
    // MARK: LoginPresenterProtocol
    
    func doLogin(user: String, password: String) {
        
        interactor.doLogin(user: user, password: password)
    }
    
    func goToRegister() {
    
        registerWireframe.present()
    }
    
    
    // MARK: LoginInteractorOutputProtocol

    func goToCalendar() {
        
    }
}
