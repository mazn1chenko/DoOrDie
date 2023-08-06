//
//  LogInViewController.swift
//  DoOrDie
//
//  Created by m223 on 05.08.2023.
//

import UIKit

protocol LogInViewControllerDelegate: AnyObject {
    
    func tapTheLoginButton()
    
}

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    weak var delegate: LogInViewControllerDelegate?
    
    private let registrationLabel = UILabel()

    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let confirmButton = UIButton(type: .system)

    private let userDefaults: UserDefaultsManagerProtocol = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemPink
        
        navigationItem.backBarButtonItem?.isHidden = true
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        registrationLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationLabel.text = "Log in to the application"
        registrationLabel.textColor = Resources.Colors.blackFontColor
        registrationLabel.font = UIFont(name: "NunitoSans-Bold", size: 22)
        registrationLabel.sizeToFit()
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.delegate = self
        loginTextField.textColor = .black
        loginTextField.backgroundColor = .white
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        loginTextField.layer.cornerRadius = 10

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.backgroundColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTextField.textColor = .black
        passwordTextField.layer.cornerRadius = 10

        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.setTitle("LogIn", for: .normal)
        confirmButton.backgroundColor = .white
        confirmButton.titleLabel?.textColor = .black
        confirmButton.titleLabel?.font = UIFont(name: "NunitoSans-Bold", size: 20)
        confirmButton.layer.cornerRadius = 10
        confirmButton.addTarget(self, action: #selector(gettingDateFromTextField), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        view.addSubview(registrationLabel)
        
        NSLayoutConstraint.activate([
                    
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),
            
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -30),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),

            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmButton.heightAnchor.constraint(equalToConstant: 60),
            confirmButton.widthAnchor.constraint(equalToConstant: 150),
            
            registrationLabel.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -50),
            registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
        
    }
    
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            if textField.text == nil || textField.text == "" {

                textField.placeholder = nil
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField.text == nil || textField.text == "" {

                textField.placeholder = "Placeholder Text"
            }
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            
            return true
        }
    
    
    @objc func gettingDateFromTextField() {
        
        if let loginText = loginTextField.text, let passwordText = passwordTextField.text {
            
            let infoUserModel = InfoUserModel(name: loginText, password: passwordText)
            
            userDefaults.set(infoUserModel.name, forKey: .nameOfUser)
            userDefaults.set(infoUserModel.password, forKey: .passwordUser)
            
            navigationController?.pushViewController(MainPageContainerViewController(), animated: true)
            delegate?.tapTheLoginButton()
        }
        
        
    }

    
}


