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
}


class RegisterPresenter: BasePresenter, RegisterPresenterProtocol, RegisterInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: RegisterViewControllerProtocol?
    private var interactor: RegisterInteractorInputProtocol?
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: RegisterViewControllerProtocol, interactor: RegisterInteractorInputProtocol) {
        
        super.init(baseView: view)
        self.view = view
        self.interactor = interactor
    }
    
    
    // MARK: RegisterPresenterProtocol
    
    func doRegister(user: String, password: String, repeatPass: String) {
    
    }
    
    
    // MARK: RegisterInteractorOutputProtocol
    
    
}
