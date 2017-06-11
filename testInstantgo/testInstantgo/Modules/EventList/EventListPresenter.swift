//
//  EventListPresenter.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import EventKit


protocol EventListPresenterProtocol: class {
    
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    func loadEvents()
}

protocol EventListInteractorOutputProtocol: class, BaseInteractorOutputProtocol {
    
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func show(events: [Any])
}


class EventListPresenter: BasePresenter, EventListPresenterProtocol, EventListInteractorOutputProtocol {
    
    // MARK: Properties
    
    private weak var view: EventListViewControllerProtocol?
    private var interactor: EventListInteractorInputProtocol
    
//    Wireframe of the next view
//    private var wireframe: NextViewWireframeProtocol?
    
    
    // MARK: - Object lifecycle
    
    init(view: EventListViewControllerProtocol, interactor: EventListInteractorInputProtocol) {
        
        self.view = view
        self.interactor = interactor
        super.init(baseView: view)
    }
    
    
    // MARK: EventListPresenterProtocol
    
    func loadEvents() {
        
        interactor.loadEvents()
    }
    
    
    // MARK: EventListInteractorOutputProtocol
    
    func show(events: [Any]) {
        
        let eventViewModel = events.map{EventViewModel(event: $0 as! EKEvent)}
        view?.show(events: eventViewModel)
    }
}
