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

protocol LoginInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
        
    func goToCalendar()
}


class LoginPresenter: BasePresenter, LoginPresenterProtocol, LoginInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: LoginViewControllerProtocol?
    private var interactor: LoginInteractorInputProtocol?
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: LoginViewControllerProtocol, interactor: LoginInteractorInputProtocol) {
        
        super.init(baseView: view)
        self.view = view
        self.interactor = interactor
    }
    
    
    // MARK: LoginPresenterProtocol
    
    func doLogin(user: String, password: String) {
        
        interactor?.doLogin(user: user, password: password)
    }
    
    
    // MARK: LoginInteractorOutputProtocol

    func goToCalendar() {
        
    }
}
