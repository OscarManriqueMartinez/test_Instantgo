//
//  EventListWireframe.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol EventListWireframeProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
    func present()
}


class EventListWireframe: EventListWireframeProtocol {
    
    // MARK: - Properties
    
    private var viewController: EventListViewController {
        
        // Generating module components
        let viewController: EventListViewController = EventListViewController(nibName: "EventListView", bundle: nil)
        let interactor: EventListInteractor = createInteractor(with: dataManager)
        let presenter: EventListPresenter = createPresenter(with: viewController, interactor: interactor)
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        return viewController
    }
    
    private var localData: EventListLocalDataProtocol{
        return EventListLocalData()
    }
    
    private var dataManager: EventListDataManager{
        return EventListDataManager(localData: localData)
    }
    
    
    // MARK: - Private methods
    
    private func createInteractor(with dataManager: EventListDataManagerProtocol) -> EventListInteractor {
        return EventListInteractor(dataManager: dataManager)
    }
    
    private func createPresenter(with view: EventListViewController, interactor: EventListInteractor ) -> EventListPresenter {
        return EventListPresenter(view: view, interactor: interactor)
    }    
    
    
    // MARK: - EventListWireframeProtocol
    
    func present() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        let nav : UINavigationController = window!.rootViewController as! UINavigationController
        nav.pushViewController(viewController, animated: true)
        
        if let loginController = nav.viewControllers.first as? LoginViewController{
            loginController.removeFromParentViewController()
        }
    }
}






