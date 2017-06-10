//
//  BaseViewController.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol  {
//    var loadingView: LoadingView{get set}
    func show(error: String)
//    func dismissController()
//    func popToRootViewController()
}

class BaseViewController: UIViewController {


    // MARK: - BaseViewControllerProtocol
    
    func show(error: String){
        
        self.present(AlertFactory.alert(error: error), animated: true, completion: nil)
    }
}
