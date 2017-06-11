//
//  EventListInteractor.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import Foundation

protocol EventListInteractorInputProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func set(presenter: EventListInteractorOutputProtocol)
    
    func loadEvents()
}


class EventListInteractor: EventListInteractorInputProtocol {
    
    // MARK: Properties
    
    private weak var presenter: EventListInteractorOutputProtocol?
    private var dataManager: EventListDataManagerProtocol
    
    private var startDate = Date()
    private var endDate = Date().addingTimeInterval(Constants.dayInSeconds*7*30)
    private var retryTime = 0
    private var events: [Any] = []
    
    // MARK: - Object lifecycle
    
    init(dataManager: EventListDataManagerProtocol) {
        
        self.dataManager = dataManager
    }

    
    // MARK: EventListInteractorInputProtocol
    
    func set(presenter: EventListInteractorOutputProtocol) {
        
        self.presenter = presenter
    }
    
    func loadEvents() {
        
        let newEvents = dataManager.getEvents(startDate: startDate, endDate: endDate)
        
        if newEvents.count > 0 {
            events = newEvents
            presenter?.show(events: events)
            
        }else {
            loadMoreEvents()
        }
    }
    
    func loadMoreEvents() {
        
        if retryTime >= Constants.maxRetryTime { return }
        
        retryTime += 1
        
        startDate = startDate.addingTimeInterval(Constants.dayInSeconds*7*30)
        endDate = endDate.addingTimeInterval(Constants.dayInSeconds*7*30)
        
        let newEvents = dataManager.getEvents(startDate: startDate, endDate: endDate)
        
        if newEvents.count > 0 {
            events.append(contentsOf: newEvents)
            presenter?.show(events: events)
        }else {
            loadMoreEvents()
        }
    }
}
