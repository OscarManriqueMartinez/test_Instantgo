//
//  ViewController+Util.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
