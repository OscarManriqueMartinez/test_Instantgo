//
//  LoginViewController.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol LoginViewControllerProtocol: class, BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: LoginPresenterProtocol)
    
}


class LoginViewController: BaseViewController, LoginViewControllerProtocol, UITextFieldDelegate {
  
    // MARK: - Properties
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txfLoginUser: UITextField!
    @IBOutlet weak var txfLoginPass: UITextField!
    
    private var presenter: LoginPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txfLoginUser.placeholder = "email.placeholder".localized
        txfLoginUser.delegate = self
        txfLoginPass.placeholder = "password.placeholder".localized
        txfLoginPass.delegate = self
        btnLogin.setTitle("login.button".localized, for: .normal)
        btnRegister.setTitle("register.button".localized, for: .normal)
    }
    
    
    // MARK: - LoginViewProtocol
    
    func set(presenter: LoginPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    
    // MARK: - Actions
    
    @IBAction private func tapLogin(_ sender: Any) {
        
        guard let user = txfLoginUser.text, let pass = txfLoginPass.text else {
            return
        }
        
        showLoading()
        
        presenter?.doLogin(user: user, password: pass)
    }
    
    @IBAction private func tapRegister(_ sender: Any) {
        
        presenter?.goToRegister()
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txfLoginUser {
            txfLoginPass.becomeFirstResponder()
            return false
        }
    
        self.view.endEditing(true)
        return false
    }
}
