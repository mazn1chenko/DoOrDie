//
//  ViewController.swift
//  DoOrDie
//
//  Created by m223 on 18.07.2023.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    let menuButtonNavigationBar = UIButton(type: .system)
    let stackView = UIStackView()
    let nameUserLabel = UILabel()
    let descriptionLabel = UILabel()
    let searchBar = UISearchBar()
    let seeCalendarButton = UIButton(type: .system)
    let addNewTask = UIButton(type: .system)
//    let girlImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        settingsNavigationBar()
        setup()
        layout()
    }
    
    private func settingsNavigationBar() {
        let customBarButtonItem = UIBarButtonItem(customView: menuButtonNavigationBar)
        navigationItem.leftBarButtonItem = customBarButtonItem
        
    }
    
    private func setup() {
        menuButtonNavigationBar.setImage(UIImage(named:"IconMenu"), for: .normal)
        menuButtonNavigationBar.tintColor = .black
        menuButtonNavigationBar.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.axis = .vertical
        
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.text = "Hi, NoName!"
        nameUserLabel.font = UIFont(name: "NunitoSans-Bold", size: 20)
        nameUserLabel.textColor = .black
        nameUserLabel.textAlignment = .left
                
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "These are your tasks for today"
        descriptionLabel.font = UIFont(name: "NunitoSans-Light", size: 16)
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .left
        descriptionLabel.sizeToFit()
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.applyCommonStyle()
        searchBar.delegate = self
        
        seeCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        seeCalendarButton.setTitle("See calendar", for: .normal)
        seeCalendarButton.setTitleColor(.blue, for: .normal)
        seeCalendarButton.backgroundColor = .white
        seeCalendarButton.titleLabel?.font = UIFont(name: "NunitoSans-Light", size: 14)
        seeCalendarButton.addTarget(self, action: #selector(getAllCalendar), for: .touchUpInside)
  
        addNewTask.translatesAutoresizingMaskIntoConstraints = false
        addNewTask.setTitle("+ ADD NEW TASK", for: .normal)
        addNewTask.setTitleColor(.white, for: .normal)
        addNewTask.backgroundColor = .blue
        addNewTask.layer.cornerRadius = 10
        addNewTask.titleLabel?.font = UIFont(name: "NunitoSans-Light", size: 12)
        addNewTask.addTarget(self, action: #selector(addNewTaskTarget), for: .touchUpInside)

//        girlImageView.translatesAutoresizingMaskIntoConstraints = false
//        girlImageView.image = UIImage(named: "girl")
    }
    
    private func layout() {
        view.addSubview(stackView)
        view.addSubview(seeCalendarButton)
        view.addSubview(addNewTask)
//        view.addSubview(girlImageView)
        stackView.addArrangedSubview(nameUserLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(searchBar)
        
        let sideConstantLeadingTrailing : CGFloat = 30
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height / 1.45)),
            
            nameUserLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: sideConstantLeadingTrailing),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: sideConstantLeadingTrailing),

            searchBar.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: sideConstantLeadingTrailing),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstantLeadingTrailing),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
            seeCalendarButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            seeCalendarButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sideConstantLeadingTrailing),
                   
            addNewTask.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            addNewTask.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sideConstantLeadingTrailing),
            addNewTask.widthAnchor.constraint(equalToConstant: view.frame.width / 3.5),
            
//            girlImageView.topAnchor.constraint(equalTo: menuButtonNavigationBar.firstBaselineAnchor),
//            girlImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            girlImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 8),
//            girlImageView.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5)
            ])
    }
    
    //MARK: - @objc function actually for addTarget
    
    @objc func menuButtonAction(){
        
        print("MenuButton")
        
    }
    
    @objc func getAllCalendar() {
        
        print("AllCalendar")
    }
    
    @objc func addNewTaskTarget() {
        
        print("addNewTask")
    }
}

extension UISearchBar: UISearchBarDelegate {
    
    func applyCommonStyle(){
        
        self.backgroundColor = .white
        self.barTintColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.searchTextField.backgroundColor = .white
        
        if let textField = self.value(forKey: "searchField") as? UITextField {
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray,
            ]
            
            let placeholderAttributedString = NSMutableAttributedString(string: "I`II help you throw your schedule", attributes: placeholderAttributes)
            
            textField.attributedPlaceholder = placeholderAttributedString
        }
        
    }
    
}

