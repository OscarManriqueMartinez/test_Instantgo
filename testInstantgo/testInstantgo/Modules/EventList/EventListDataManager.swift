//
//  EventListDataManager.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import Foundation


protocol EventListDataManagerProtocol: class {
    
    /**
     * Add here your methods for communication INTERACTOR -> DATA_MANAGER
     */
    
    func getEvents(startDate: Date, endDate: Date) -> [Any]
}


class EventListDataManager: EventListDataManagerProtocol {
    
    // MARK: - Properties
    
    private var localData: EventListLocalDataProtocol
    
    
    // MARK: - Object lifecycle
    
    init(localData: EventListLocalDataProtocol) {
        
        self.localData = localData
    }
    
    
    // MARK: - EventListDataManagerProtocol
    
    func getEvents(startDate: Date, endDate: Date) -> [Any] {
        
        return localData.getEvents(startDate: startDate, endDate: endDate)
    }
}






