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

    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
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
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        nameTextField.textColor = .black
        nameTextField.backgroundColor = .white
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        nameTextField.layer.cornerRadius = 10
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        emailTextField.textColor = .black
        emailTextField.backgroundColor = .white
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter your email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        emailTextField.layer.cornerRadius = 10

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
        view.addSubview(emailTextField)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmButton)
        view.addSubview(registrationLabel)
        
        NSLayoutConstraint.activate([
                    
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),
            
            nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -30),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.2),

            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            confirmButton.heightAnchor.constraint(equalToConstant: 60),
            confirmButton.widthAnchor.constraint(equalToConstant: 150),
            
            registrationLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -50),
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
        
        if let loginText = nameTextField.text, let passwordText = passwordTextField.text, let emailText = emailTextField.text {
            
            let infoUserModel = InfoUserModel(name: loginText, email: emailText, password: passwordText)
            
            userDefaults.set(infoUserModel.name, forKey: .nameOfUser)
            userDefaults.set(infoUserModel.email, forKey: .emailOfUser)
            userDefaults.set(infoUserModel.password, forKey: .passwordUser)
            
            navigationController?.pushViewController(MainPageContainerViewController(), animated: true)
            delegate?.tapTheLoginButton()
        }
        
        
    }

    
}


