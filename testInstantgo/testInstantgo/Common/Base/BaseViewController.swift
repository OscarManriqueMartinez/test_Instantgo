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
    
    func show(error: String)

    func showLoading()
    
    func hideLoading()
}

class BaseViewController: UIViewController {

    // MARK: - Properties
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up activity indicator
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor.blue
        self.view.addSubview(activityIndicator)
    }
    
    
    // MARK: - BaseViewControllerProtocol
    
    func show(error: String){
        
        hideLoading()
        self.present(AlertFactory.alert(error: error), animated: true, completion: nil)
    }
    
    func showLoading() {
        
        activityIndicator.startAnimating()
    }
    
    func hideLoading(){
        
        activityIndicator.stopAnimating()
    }
}
