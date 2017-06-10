//
//  AlertFactory.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import UIKit


class AlertFactory {
    
    static func alert(error: String) -> UIAlertController {
        
        let alert: UIAlertController = UIAlertController(title: "error".localized, message: error.localized, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.cancel, handler: nil))
        
        return alert
    }
    
    static func alertRegister(action:@escaping (Void) -> Void) -> UIAlertController {
        
        let alert: UIAlertController = UIAlertController(title: "register".localized, message: "register.description".localized, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "ok".localized, style: UIAlertActionStyle.cancel, handler: { event in
            action()
        }))
        
        return alert
    }
}
