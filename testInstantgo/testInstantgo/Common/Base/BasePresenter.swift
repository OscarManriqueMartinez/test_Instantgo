//
//  BasePresenter.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright © 2017 Óscar Manrique. All rights reserved.
//

protocol BaseInteractorOutputProtocol {
    
    func show(error: BaseError)
}

class BasePresenter
{
    // MARK: - Properties
    
    var baseView: BaseViewControllerProtocol
    
    
    // MARK: - Object lifecycle
    
    init(baseView:BaseViewControllerProtocol) {
        self.baseView = baseView
    }
    
    
    // MARK: - BaseInteractorOutputProtocol
    
    func show(error: BaseError){
        
        baseView.show(error: error.description())
    }
}
