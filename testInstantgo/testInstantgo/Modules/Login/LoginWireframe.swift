//
//  LoginWireframe.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol LoginWireframeProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}


class LoginWireframe: LoginWireframeProtocol {

    
    // MARK: - Properties
    
    var viewController: LoginViewController {
        
        // Generating module components
        let viewController: LoginViewController = LoginViewController(nibName: "LoginView", bundle: nil)
        let interactor: LoginInteractor = createInteractor(with: dataManager)
        let presenter: LoginPresenter = createPresenter(with: viewController, interactor: interactor, registerWireframe: registerWireframe, eventListWireframe: eventListWireframe)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var apiClient: LoginAPIClient{
        return LoginAPIClient()
    }
    
    private var dataManager: LoginDataManager{
        return LoginDataManager(apiClient: apiClient)
    }
    
    private var registerWireframe: RegisterWireframeProtocol{
        return RegisterWireframe()
    }
    
    private var eventListWireframe: EventListWireframeProtocol{
        return EventListWireframe()
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: LoginDataManagerProtocol) -> LoginInteractor {
        return LoginInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: LoginViewController, interactor: LoginInteractor, registerWireframe: RegisterWireframeProtocol, eventListWireframe: EventListWireframeProtocol) -> LoginPresenter {
        return LoginPresenter(view: view, interactor: interactor, registerWireframe: registerWireframe, eventListWireframe: eventListWireframe)
    }    
    
    
    // MARK: - LoginWireframeProtocol
}






