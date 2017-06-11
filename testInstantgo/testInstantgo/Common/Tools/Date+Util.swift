//
//  Date+Util.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 11/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation


extension Date{
    
    func toString(format: String = "dd/MM/yyyy hh:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
