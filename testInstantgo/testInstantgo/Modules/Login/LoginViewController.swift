//
//  LoginViewController.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit


protocol LoginViewControllerProtocol: class {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: LoginPresenterProtocol)
    
    func show(error: String)
}


class LoginViewController: UIViewController, LoginViewControllerProtocol {
  
    // MARK: - Properties
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txfLoginUser: UITextField!
    @IBOutlet weak var txfLoginPass: UITextField!
    
    private var presenter: LoginPresenterProtocol?
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txfLoginUser.placeholder = "login.email.placeholder".localized
        txfLoginPass.placeholder = "login.password.placeholder".localized
        btnLogin.setTitle("login.login.button".localized, for: .normal)
        btnRegister.setTitle("login.register.button".localized, for: .normal)
    }
    
    
    // MARK: - LoginViewProtocol
    
    func set(presenter: LoginPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func show(error: String) {
        
        self.present(AlertFactory.alert(error: error), animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    
    @IBAction private func tapLogin(_ sender: Any) {
        
        guard let user = txfLoginUser.text, let pass = txfLoginPass.text else {
            return
        }
        
        presenter?.doLogin(user: user, password: pass)
    }
    
    @IBAction private func tapRegister(_ sender: Any) {
        
    }
    
}
