//
//  RegisterViewController.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol RegisterViewControllerProtocol: class, BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: RegisterPresenterProtocol)
    
    func close()
    
    func showRegisterSuccess()
}


class RegisterViewController: BaseViewController, RegisterViewControllerProtocol {
  
    // MARK: - Properties
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txfRegisterUser: UITextField!
    @IBOutlet weak var txfRegisterPass: UITextField!
    @IBOutlet weak var txfRegisterRepeatPass: UITextField!
    
    private var presenter: RegisterPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txfRegisterUser.placeholder = "email.placeholder".localized
        txfRegisterPass.placeholder = "password.placeholder".localized
        txfRegisterRepeatPass.placeholder = "password.repeat.placeholder".localized
        btnRegister.setTitle("register.button".localized, for: .normal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
    }
    
    
    // MARK: - RegisterViewProtocol
    
    func set(presenter: RegisterPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func showRegisterSuccess() {
        
        self.present(AlertFactory.alertRegister(action: {self.close()}), animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    
    @IBAction private func tapRegister(_ sender: Any) {
        
        guard let user = txfRegisterUser.text, let pass = txfRegisterPass.text, let repeatPass = txfRegisterRepeatPass.text else {
            return
        }
        
        presenter?.doRegister(user: user, password: pass, repeatPass: repeatPass)
    }
    
    func close() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
