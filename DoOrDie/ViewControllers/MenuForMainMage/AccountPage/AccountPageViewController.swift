//
//  AccountPageViewController.swift
//  DoOrDie
//
//  Created by m223 on 01.08.2023.
//

import UIKit

class AccountPageViewController: UIViewController {
    
    var label = UILabel()
    var addPhotoLabel = UILabel()
    
    var mainTableView = UITableView()
    
    var mainStackView = UIStackView()
    var edittingButtonsStackView = UIStackView()
    
    var photoOfUserImageView = UIImageView()
    
    var nameOfUserTextField = UITextField()
    var emailOfUserTextField = UITextField()
    
    var freeAccountButton = UIButton(type: .system)
    var editNameOfUserButton = UIButton(type: .system)
    var editEmailOfUserButton = UIButton(type: .system)
    var changePhotoOfUserButton = UIButton(type: .system)
    var upgradePremiumButton = UIButton(type: .system)
    
    var userDefaults: UserDefaultsManagerProtocol = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "Account"
        
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .white
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .leading
        
        edittingButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        edittingButtonsStackView.backgroundColor = .white
        edittingButtonsStackView.axis = .vertical
        edittingButtonsStackView.distribution = .fillProportionally
        edittingButtonsStackView.alignment = .trailing
        
        photoOfUserImageView.translatesAutoresizingMaskIntoConstraints = false
        photoOfUserImageView.image = UIImage(named: "account")
        
        
        changePhotoOfUserButton.translatesAutoresizingMaskIntoConstraints = false
        changePhotoOfUserButton.setTitle("Edit", for: .normal)
        changePhotoOfUserButton.setTitleColor(.gray, for: .normal)
        changePhotoOfUserButton.titleLabel?.font = UIFont(name: "NunitoSans-Light", size: 18)
        changePhotoOfUserButton.addTarget(self, action: #selector(changePhotoOfUser), for: .touchUpInside)
        
        nameOfUserTextField.translatesAutoresizingMaskIntoConstraints = false
        nameOfUserTextField.textColor = .black
        nameOfUserTextField.attributedPlaceholder = NSAttributedString(string: "\(userDefaults.string(forKey: .nameOfUser)!)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])

        
        emailOfUserTextField.translatesAutoresizingMaskIntoConstraints = false
        emailOfUserTextField.textColor = .black
        emailOfUserTextField.attributedPlaceholder = NSAttributedString(string: "\(userDefaults.string(forKey: .emailOfUser)!)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        freeAccountButton.translatesAutoresizingMaskIntoConstraints = false
        freeAccountButton.setTitle("Free Account", for: .normal)
        freeAccountButton.setTitleColor(.white, for: .normal)
        freeAccountButton.layer.cornerRadius = 10
        freeAccountButton.backgroundColor = Resources.Colors.blueFont
        freeAccountButton.addTarget(self, action: #selector(tapFreeAccount), for: .touchUpInside)
        
        editNameOfUserButton.translatesAutoresizingMaskIntoConstraints = false
        editNameOfUserButton.setImage(UIImage(named: "editButton"), for: .normal)
        editNameOfUserButton.addTarget(self, action: #selector(editNameOfUser), for: .touchUpInside)
        
        editEmailOfUserButton.translatesAutoresizingMaskIntoConstraints = false
        editEmailOfUserButton.setImage(UIImage(named: "editButton"), for: .normal)
        editEmailOfUserButton.addTarget(self, action: #selector(editEmailOfUser), for: .touchUpInside)
        
        upgradePremiumButton.translatesAutoresizingMaskIntoConstraints = false
        upgradePremiumButton.setTitle("Upgrade to PREMIUM", for: .normal)
        upgradePremiumButton.titleLabel?.font = UIFont(name: "NunitoSans-Bold", size: 20)
        upgradePremiumButton.setTitleColor(Resources.Colors.blueFont, for: .normal)
        upgradePremiumButton.addTarget(self, action: #selector(upgradePremium), for: .touchUpInside)
        
        
    }
    
    private func setupConstraints() {
        view.addSubview(photoOfUserImageView)
        view.addSubview(changePhotoOfUserButton)
        view.addSubview(mainStackView)
        view.addSubview(edittingButtonsStackView)
        view.addSubview(upgradePremiumButton)
        edittingButtonsStackView.addArrangedSubview(editNameOfUserButton)
        edittingButtonsStackView.addArrangedSubview(editEmailOfUserButton)
        mainStackView.addArrangedSubview(nameOfUserTextField)
        mainStackView.addArrangedSubview(emailOfUserTextField)
        mainStackView.addArrangedSubview(freeAccountButton)


        NSLayoutConstraint.activate([

            photoOfUserImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            photoOfUserImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            photoOfUserImageView.heightAnchor.constraint(equalToConstant: view.frame.width / 4.5),
            photoOfUserImageView.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5),
            
            changePhotoOfUserButton.topAnchor.constraint(equalTo: photoOfUserImageView.bottomAnchor, constant: -5),
            changePhotoOfUserButton.centerXAnchor.constraint(equalTo: photoOfUserImageView.centerXAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: photoOfUserImageView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: photoOfUserImageView.trailingAnchor, constant: 5),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: view.frame.width / 8),
            mainStackView.bottomAnchor.constraint(equalTo: photoOfUserImageView.bottomAnchor, constant: 10),
            
            edittingButtonsStackView.topAnchor.constraint(equalTo: photoOfUserImageView.topAnchor),
            edittingButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            edittingButtonsStackView.widthAnchor.constraint(equalToConstant: view.frame.height / 19),
            edittingButtonsStackView.heightAnchor.constraint(equalToConstant: view.frame.height / 19),
            
            upgradePremiumButton.topAnchor.constraint(equalTo: changePhotoOfUserButton.bottomAnchor, constant: 5),
            upgradePremiumButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            freeAccountButton.heightAnchor.constraint(equalToConstant: 35),
            freeAccountButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    @objc func changePhotoOfUser() {
        
        print("changePhotoOfUser")
        
    }
    
    @objc func tapFreeAccount() {
        
        let alertController = UIAlertController(title: "Warning!", message: "Free account - basic functionality, but in future can buy premium and gets something special", preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Okey!", style: .cancel)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true)
        
    }
    
    @objc func editNameOfUser() {
        
        print("editNameOfUser")
        
    }
    @objc func editEmailOfUser() {
        
        print("editEmailOfUser")
        
    }
    @objc func upgradePremium() {
        
        
        let alertController = UIAlertController(title: "Warning!", message: "This function in beta!", preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Okey!", style: .cancel)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true)
        
    }
}

