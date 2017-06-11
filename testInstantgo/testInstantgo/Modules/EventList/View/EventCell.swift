//
//  EventCell.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 11/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var organizer: UILabel!
    
    @IBOutlet weak var titleValue: UILabel!
    @IBOutlet weak var startDateValue: UILabel!
    @IBOutlet weak var endDateValue: UILabel!
    @IBOutlet weak var organizerValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        title.text = "event.title".localized
        startDate.text = "event.start.date".localized
        endDate.text = "event.end.date".localized
        organizer.text = "event.organizer".localized
    }

    func setUp(eventViewModel: EventViewModel) {
        
        titleValue.text = eventViewModel.title
        startDateValue.text = eventViewModel.startDate
        endDateValue.text = eventViewModel.endDate
        organizerValue.text = eventViewModel.organizer
    }
    
}
