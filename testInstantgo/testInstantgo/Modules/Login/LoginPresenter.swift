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
}

protocol LoginInteractorOutputProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func show(error: BaseError)
    
    func goToCalendar()
}


class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: LoginViewControllerProtocol?
    private var interactor: LoginInteractorInputProtocol?
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: LoginViewControllerProtocol, interactor: LoginInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
    }
    
    
    // MARK: LoginPresenterProtocol
    
    func doLogin(user: String, password: String) {
        
        interactor?.doLogin(user: user, password: password)
    }
    
    
    // MARK: LoginInteractorOutputProtocol
    
    func show(error: BaseError) {
        
        view?.show(error: error.description())
    }

    func goToCalendar() {
        
    }
}
