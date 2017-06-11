//
//  EventViewModel.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 11/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation
import EventKit

struct EventViewModel {
    let title: String
    let startDate: String
    let endDate: String
    var organizer: String = ""
    
    init(event: EKEvent) {

        title = event.title
        startDate = event.startDate.toString()
        endDate = event.endDate.toString()
        
        if let name = event.organizer?.name {
            organizer = name
        }
    }
}
