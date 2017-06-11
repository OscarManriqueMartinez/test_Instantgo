//
//  EventListLocalData.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import EventKit

protocol EventListLocalDataProtocol: class {
    
    /**
     * Add here your methods for communication DATA_MANAGER -> LOCAL_DATA
     */
    
    func getEvents(startDate: Date, endDate: Date) -> [Any]
}


class EventListLocalData: EventListLocalDataProtocol {
    
    // MARK: - Properties
    
    private let eventStore = EKEventStore()
    
    
    // MARK: - EventListLocalDataProtocol
 
    func getEvents(startDate: Date, endDate: Date) -> [Any] {
        
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: eventStore.calendars(for: EKEntityType.event))
        
        return eventStore.events(matching: predicate)
    }
}






