//
//  String+Util.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func isValidPassword() -> Bool {
        
        if let lengthPassword: Int = Enviroment().lengthPassword {
            return self.characters.count >= lengthPassword
        }
        
        return false
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
