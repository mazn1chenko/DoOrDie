//
//  LogInViewController.swift
//  DoOrDie
//
//  Created by m223 on 05.08.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let confirmButton = UIButton(type: .system)

    private let userDefaults: UserDefaultsManagerProtocol = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .lightGray
        
        navigationItem.backBarButtonItem?.isHidden = true
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.delegate = self
        loginTextField.backgroundColor = .white
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.backgroundColor = .white

        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.setTitle("TAP THE BUTTON BITCH", for: .normal)
        confirmButton.backgroundColor = .white
        confirmButton.addTarget(self, action: #selector(gettingDateFromTextField), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
        
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.1),
            
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -30),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.1),

            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmButton.heightAnchor.constraint(equalToConstant: 100),
            confirmButton.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
    @objc func gettingDateFromTextField() {
        
        if let loginText = loginTextField.text, let passwordText = passwordTextField.text {
            
            let infoUserModel = InfoUserModel(name: loginText, password: passwordText)
            
            userDefaults.set(infoUserModel.name, forKey: .nameOfUser)
            userDefaults.set(infoUserModel.password, forKey: .passwordUser)
            
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
}
