//
//  AddNewTaskViewController.swift
//  DoOrDie
//
//  Created by m223 on 20.07.2023.
//

import UIKit
import RealmSwift

class AddNewTaskViewController: UIViewController{
    
    weak var delegate: AddNewTaskDelegate?
    
    let headerOfViewControllerLabel = UILabel()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let categoriesLabel = UILabel()
    let teamLabel = UILabel()
    let name1Label = UILabel()
    let name2Label = UILabel()
    let name3Label = UILabel()
    let descriptionLabel = UILabel()
    
    var titleTextField = UITextField()
    let dateTextField = UITextField()
    let categoriesTextField = UITextField()
    let teamTextField = UITextField()
    let descriptionTextField = UITextField()
    
    let buttonsCategoriesStackView = UIStackView()
    let teamStackView = UIStackView()
    let iconsTeamStackView = UIStackView()
    let nameOfTeamStackView = UIStackView()
    
    let homeworkCaterogiesButton = UIButton(type: .system)
    let workCategoriesButton = UIButton(type: .system)
    let familyCategoriesButton = UIButton(type: .system)
    let calendarButton = UIButton(type: .system)
    let categoriesButton = UIButton(type: .system)
    let teamButton = UIButton(type: .system)
    let doneButtonNavigationBar = UIButton(type: .system)
    
    let avatar1UIImageView = UIImageView()
    let avatar2UIImageView = UIImageView()
    let avatar3UIImageView = UIImageView()
    
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        settingsNavigationBar()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {

        titleLabel.settingsLabel("Title")
        
        dateLabel.settingsLabel("Date")
        
        categoriesLabel.settingsLabel("Categories")
        
        teamLabel.settingsLabel("Team")
        
        
        doneButtonNavigationBar.setImage(UIImage(named:"doneButton"), for: .normal)
        doneButtonNavigationBar.tintColor = Resources.Colors.titleColorOfTextFieldCreateTaskView
        doneButtonNavigationBar.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
        headerOfViewControllerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerOfViewControllerLabel.text = "Create a task"
        headerOfViewControllerLabel.textColor = Resources.Colors.blackFontColor
        headerOfViewControllerLabel.font = UIFont(name: "NunitoSans-Bold", size: 22)
        
        
        titleTextField.settingsTextField(text: "Webpage delivery", placeholderText: Resources.Colors.titleColorOfTextFieldCreateTaskView)
        
        dateTextField.settingsTextField(text: "July 23rd - August 05th", placeholderText: Resources.Colors.titleColorOfTextFieldCreateTaskView)
        
        categoriesTextField.settingsTextField(text: "Choose as much as you want", placeholderText: .lightGray)
        
        teamTextField.settingsTextField(text: "Who`s working  on this task?", placeholderText: .lightGray)
        
        
        //MARK: - buttonsCategoriesStackView (stackView, buttons)
        buttonsCategoriesStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsCategoriesStackView.backgroundColor = .white
        buttonsCategoriesStackView.distribution = .fillEqually
        buttonsCategoriesStackView.spacing = 5
        
        homeworkCaterogiesButton.translatesAutoresizingMaskIntoConstraints = false
        homeworkCaterogiesButton.setTitle("Homework", for: .normal)
        homeworkCaterogiesButton.tintColor = .white
        homeworkCaterogiesButton.layer.cornerRadius = 10
        homeworkCaterogiesButton.tag = 1
        homeworkCaterogiesButton.backgroundColor = Resources.Colors.buttonsCategories.homeworkcolor
        homeworkCaterogiesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
        
        workCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        workCategoriesButton.setTitle("Work", for: .normal)
        workCategoriesButton.tintColor = .white
        workCategoriesButton.layer.cornerRadius = 10
        workCategoriesButton.tag = 2
        workCategoriesButton.backgroundColor = Resources.Colors.buttonsCategories.workColor
        workCategoriesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
        
        familyCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        familyCategoriesButton.setTitle("Family", for: .normal)
        familyCategoriesButton.tintColor = .white
        familyCategoriesButton.layer.cornerRadius = 10
        familyCategoriesButton.tag = 3
        familyCategoriesButton.backgroundColor = Resources.Colors.buttonsCategories.familycolor
        familyCategoriesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
        
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        calendarButton.setImage(UIImage(named: "calendar"), for: .normal)
        calendarButton.backgroundColor = .white
        calendarButton.tintColor = Resources.Colors.titleColorOfTextFieldCreateTaskView
        calendarButton.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        
        categoriesButton.translatesAutoresizingMaskIntoConstraints = false
        categoriesButton.setImage(UIImage(named: "arrow"), for: .normal)
        categoriesButton.backgroundColor = .white
        categoriesButton.tintColor = Resources.Colors.titleColorOfTextFieldCreateTaskView
        categoriesButton.addTarget(self, action: #selector(openCategories), for: .touchUpInside)
        
        teamButton.translatesAutoresizingMaskIntoConstraints = false
        teamButton.setImage(UIImage(named: "arrow"), for: .normal)
        teamButton.backgroundColor = .white
        teamButton.tintColor = Resources.Colors.titleColorOfTextFieldCreateTaskView
        teamButton.addTarget(self, action: #selector(openTeam), for: .touchUpInside)
        
        //MARK: - teamStackView (stackViews, imageViews, labels)
        
        teamStackView.translatesAutoresizingMaskIntoConstraints = false
        teamStackView.backgroundColor = .white
        teamStackView.distribution = .fillEqually
        teamStackView.axis = .vertical
        teamStackView.spacing = 10
        teamStackView.alignment = .center
        
        iconsTeamStackView.translatesAutoresizingMaskIntoConstraints = false
        iconsTeamStackView.backgroundColor = .white
        iconsTeamStackView.distribution = .fillEqually
        iconsTeamStackView.spacing = 10
        
        nameOfTeamStackView.translatesAutoresizingMaskIntoConstraints = false
        nameOfTeamStackView.backgroundColor = .white
        nameOfTeamStackView.distribution = .fillEqually
        nameOfTeamStackView.spacing = 10
        
        
        avatar1UIImageView.translatesAutoresizingMaskIntoConstraints = false
        avatar1UIImageView.image = UIImage(named: "avatar")
        
        avatar2UIImageView.translatesAutoresizingMaskIntoConstraints = false
        avatar2UIImageView.image = UIImage(named: "avatar")
        
        avatar3UIImageView.translatesAutoresizingMaskIntoConstraints = false
        avatar3UIImageView.image = UIImage(named: "avatar")
        
        
        name1Label.translatesAutoresizingMaskIntoConstraints = false
        name1Label.textColor = Resources.Colors.blueFont
        name1Label.font = UIFont(name: "NunitoSans-Bold", size: 15)
        name1Label.textAlignment = .center
        name1Label.text = "Sarah"
        
        name2Label.translatesAutoresizingMaskIntoConstraints = false
        name2Label.textColor = Resources.Colors.blueFont
        name2Label.font = UIFont(name: "NunitoSans-Bold", size: 15)
        name2Label.textAlignment = .center
        name2Label.text = "Jane"
        
        name3Label.translatesAutoresizingMaskIntoConstraints = false
        name3Label.textColor = Resources.Colors.blueFont
        name3Label.font = UIFont(name: "NunitoSans-Bold", size: 15)
        name3Label.textAlignment = .center
        name3Label.text = "Brian"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.settingsLabel("Description")
        
        descriptionTextField.settingsTextField(text: "Write a short description", placeholderText: .lightGray)
        
        tapGesture.addTarget(self, action: #selector(hideKeyboard))
        
        
    }
    
    private func setupConstraints() {
        view.addSubview(headerOfViewControllerLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(categoriesLabel)
        view.addSubview(categoriesTextField)
        view.addSubview(buttonsCategoriesStackView)
        view.addSubview(teamLabel)
        view.addSubview(teamTextField)
        view.addSubview(teamStackView)
        view.addSubview(iconsTeamStackView)
        view.addSubview(nameOfTeamStackView)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(calendarButton)
        view.addSubview(categoriesButton)
        view.addSubview(teamButton)
        view.addGestureRecognizer(tapGesture)
        buttonsCategoriesStackView.addArrangedSubview(homeworkCaterogiesButton)
        buttonsCategoriesStackView.addArrangedSubview(workCategoriesButton)
        buttonsCategoriesStackView.addArrangedSubview(familyCategoriesButton)
        teamStackView.addArrangedSubview(iconsTeamStackView)
        teamStackView.addArrangedSubview(nameOfTeamStackView)
        iconsTeamStackView.addArrangedSubview(avatar1UIImageView)
        iconsTeamStackView.addArrangedSubview(avatar2UIImageView)
        iconsTeamStackView.addArrangedSubview(avatar3UIImageView)
        nameOfTeamStackView.addArrangedSubview(name1Label)
        nameOfTeamStackView.addArrangedSubview(name2Label)
        nameOfTeamStackView.addArrangedSubview(name3Label)
        
        let constraintOfSides : CGFloat = 30
        
        NSLayoutConstraint.activate([
            headerOfViewControllerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            headerOfViewControllerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            headerOfViewControllerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            titleLabel.topAnchor.constraint(equalTo: headerOfViewControllerLabel.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            titleTextField.heightAnchor.constraint(equalToConstant: 44),
            titleTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2),
            
            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides * 4),
            dateTextField.heightAnchor.constraint(equalToConstant: 44),
            dateTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2),
            
            calendarButton.leadingAnchor.constraint(equalTo: dateTextField.trailingAnchor, constant: 25),
            calendarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            calendarButton.bottomAnchor.constraint(equalTo: dateTextField.bottomAnchor),
            calendarButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            
            categoriesLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            categoriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            categoriesTextField.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 5),
            categoriesTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            categoriesTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides * 4),
            categoriesTextField.heightAnchor.constraint(equalToConstant: 44),
            categoriesTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2),
            
            categoriesButton.leadingAnchor.constraint(equalTo: categoriesTextField.trailingAnchor, constant: 25),
            categoriesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            categoriesButton.bottomAnchor.constraint(equalTo: categoriesTextField.bottomAnchor),
            categoriesButton.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 5),
            
            teamButton.leadingAnchor.constraint(equalTo: teamTextField.trailingAnchor, constant: 25),
            teamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            teamButton.bottomAnchor.constraint(equalTo: teamTextField.bottomAnchor),
            teamButton.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 5),
            
            buttonsCategoriesStackView.topAnchor.constraint(equalTo: categoriesTextField.bottomAnchor, constant: 10),
            buttonsCategoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            buttonsCategoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides*4.5),
            buttonsCategoriesStackView.heightAnchor.constraint(equalToConstant: 30),
            
            
            teamLabel.topAnchor.constraint(equalTo: buttonsCategoriesStackView.bottomAnchor, constant: 20),
            teamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            teamLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            teamTextField.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 5),
            teamTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            teamTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides * 4),
            teamTextField.heightAnchor.constraint(equalToConstant: 44),
            teamTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2),
            
            teamStackView.topAnchor.constraint(equalTo: teamTextField.bottomAnchor, constant: 10),
            teamStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            teamStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides*7.5),
            teamStackView.heightAnchor.constraint(equalToConstant: 80),
            
            iconsTeamStackView.topAnchor.constraint(equalTo: teamStackView.topAnchor, constant: 10),
            iconsTeamStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            iconsTeamStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides*7.5),
            iconsTeamStackView.heightAnchor.constraint(equalToConstant: 50),
            
            nameOfTeamStackView.topAnchor.constraint(equalTo: iconsTeamStackView.bottomAnchor, constant: 10),
            nameOfTeamStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            nameOfTeamStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides*7.5),
            nameOfTeamStackView.heightAnchor.constraint(equalToConstant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: teamStackView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            descriptionTextField.heightAnchor.constraint(equalToConstant: view.frame.height / 6.5),
            descriptionTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2)
            
        ])
        
    }
    
    //MARK: - @objc func
    
    @objc func tappedOnButton(action: UIButton){
        
        let buttonTag = action.tag
        
        switch buttonTag {
        case 1:
            categoriesTextField.settingsTextField(text: "Homework", placeholderText: .lightGray)
        case 2:
            categoriesTextField.settingsTextField(text: "Work", placeholderText: .lightGray)
        case 3:
            categoriesTextField.settingsTextField(text: "Another", placeholderText: .lightGray)
        default:
            break
        }
    }
    @objc func openCalendar(){
        
        print("openCalendar")
    }
    @objc func openCategories(){
        
        print("openCategories")
    }
    @objc func openTeam(){
        
        print("openTeam")
    }
    @objc func doneButtonAction(){
        
        let title = titleTextField.text ?? "NoTitle"
        let date = dateTextField.text ?? "NoDate"
        let category = categoriesTextField.text ?? "NoDate"
        let team = teamTextField.text ?? "NoDate"
        let description = descriptionTextField.text ?? "NoDate"
        
        addTaskToRealm(title: title, date: date, category: category, team: team, description: description)
        
        delegate?.didTapButton()
        navigationController?.pushViewController(MainPageViewController(), animated: true)
        
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Useful functions
    
    func addTaskToRealm(title: String, date: String, category: String, team: String, description: String) {
        do {
            let realm = try Realm()
            try realm.write {
                let newTask = TaskModel()
                newTask.title = title
                newTask.date = date
                newTask.categories = category
                newTask.team = team
                newTask.descriptionTask = description
                
                let newTasksInCategory = CategoryModel()
                newTasksInCategory.nameOfCategory = category
                
                realm.add([newTask, newTasksInCategory])
                
            }
        } catch {
            print("Error adding task: \(error.localizedDescription)")
        }
        
    }
    
    private func settingsNavigationBar() {
        let customBarButtonItem = UIBarButtonItem(customView: doneButtonNavigationBar)
        navigationItem.rightBarButtonItem = customBarButtonItem
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarButton.layer.cornerRadius = calendarButton.frame.height / 2
        calendarButton.clipsToBounds = true
        calendarButton.layer.shadowColor = UIColor.black.cgColor
        calendarButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        calendarButton.layer.shadowOpacity = 1
        calendarButton.layer.shadowRadius = 4
    }
}

//MARK: - UITextField / UITextFieldDelegate


extension UITextField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {

        textField.text = ""
        
    }

    
    func settingsTextField(text: String, placeholderText: UIColor) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.delegate = self
        self.backgroundColor = Resources.Colors.backgroundOfTextFieldCreateTaskView
        
        let padding: CGFloat = 10
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
        
        
        let attributedPlaceholderCategories = NSAttributedString(string: text, attributes: [
            .foregroundColor: placeholderText,
        ])
        self.attributedText = attributedPlaceholderCategories
        

    }
}

extension UILabel {
    
    func settingsLabel(_ text: String) {
        self.textColor = Resources.Colors.blueFont
        self.font = UIFont(name: "NunitoSans-Bold", size: 15)
        self.textAlignment = .left
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
//MARK: - Protocol didTapButton

protocol AddNewTaskDelegate: AnyObject {
    func didTapButton()
}
