//
//  RegisterWireframe.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol RegisterWireframeProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
    func present() 
}


class RegisterWireframe: RegisterWireframeProtocol {
    
    // MARK: Properties
    
    private var viewController: RegisterViewController {
        
        // Generating module components
        let viewController: RegisterViewController = RegisterViewController(nibName: "RegisterView", bundle: nil)
        let interactor: RegisterInteractor = createInteractor(with: dataManager)
        let presenter: RegisterPresenter = createPresenter(with: viewController, interactor: interactor)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var apiClient: RegisterAPIClient{
        return RegisterAPIClient()
    }
    
    private var dataManager: RegisterDataManager{
        return RegisterDataManager(apiClient: apiClient)
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: RegisterDataManagerProtocol) -> RegisterInteractor {
        return RegisterInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: RegisterViewController, interactor: RegisterInteractor ) -> RegisterPresenter {
        return RegisterPresenter(view: view, interactor: interactor)
    }    
    
    
    // MARK: RegisterWireframeProtocol
    
    func present() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        let nav : UINavigationController = window!.rootViewController as! UINavigationController
        
        nav.present(viewController, animated: true)
    }
}






