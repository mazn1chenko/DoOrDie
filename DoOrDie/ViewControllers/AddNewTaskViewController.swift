//
//  AddNewTaskViewController.swift
//  DoOrDie
//
//  Created by m223 on 20.07.2023.
//

import UIKit

class AddNewTaskViewController: UIViewController{
    
    let headerOfViewControllerLabel = UILabel()
    let titleLabel = UILabel()
    var titleTextField = UITextField()
    let dateLabel = UILabel()
    let dateTextField = UITextField()
    let categoriesLabel = UILabel()
    let categoriesTextField = UITextField()
    let buttonsCategoriesStackView = UIStackView()
    let homeworkCaterogiesButton = UIButton(type: .system)
    let workCategoriesButton = UIButton(type: .system)
    let familyCategoriesButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 10

        headerOfViewControllerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerOfViewControllerLabel.text = "Create a task"
        headerOfViewControllerLabel.textColor = Resources.Colors.blackFontColor
        headerOfViewControllerLabel.font = UIFont(name: "NunitoSans-Bold", size: 22)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Resources.Colors.blueFont
        titleLabel.font = UIFont(name: "NunitoSans-Bold", size: 15)
        titleLabel.text = "Title"
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.backgroundColor = Resources.Colors.backgroundOfTextFieldCreateTaskView
        titleTextField.tintColor = .orange
        let attributedPlaceholderTitle = NSAttributedString(string: "Webpage delivery", attributes: [
            .foregroundColor: Resources.Colors.titleColorOfTextFieldCreateTaskView,
            .paragraphStyle: paragraphStyle
        ])
        titleTextField.attributedText = attributedPlaceholderTitle
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = Resources.Colors.blueFont
        dateLabel.font = UIFont(name: "NunitoSans-Bold", size: 15)
        dateLabel.text = "Date"
        
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = Resources.Colors.backgroundOfTextFieldCreateTaskView
        dateTextField.tintColor = .orange
        let attributedPlaceholderDate = NSAttributedString(string: "July 23rd - August 05th", attributes: [
            .foregroundColor: Resources.Colors.titleColorOfTextFieldCreateTaskView,
            .paragraphStyle: paragraphStyle
        ])
        dateTextField.attributedText = attributedPlaceholderDate
        
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.textColor = Resources.Colors.blueFont
        categoriesLabel.font = UIFont(name: "NunitoSans-Bold", size: 15)
        categoriesLabel.text = "Categories"
        
        categoriesTextField.translatesAutoresizingMaskIntoConstraints = false
        categoriesTextField.backgroundColor = Resources.Colors.backgroundOfTextFieldCreateTaskView
        categoriesTextField.tintColor = .orange
        let attributedPlaceholderCategories = NSAttributedString(string: "Choose as much as you want", attributes: [
            .foregroundColor: UIColor.lightGray,
            .paragraphStyle: paragraphStyle
        ])
        categoriesTextField.attributedText = attributedPlaceholderCategories
        
        buttonsCategoriesStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsCategoriesStackView.backgroundColor = .white
        buttonsCategoriesStackView.distribution = .fillEqually
        buttonsCategoriesStackView.spacing = 5
        
        homeworkCaterogiesButton.translatesAutoresizingMaskIntoConstraints = false
        homeworkCaterogiesButton.setTitle("Homework", for: .normal)
        homeworkCaterogiesButton.tintColor = .white
        homeworkCaterogiesButton.layer.cornerRadius = 10
        homeworkCaterogiesButton.backgroundColor = Resources.Colors.buttonsCategories.homeworkcolor
        homeworkCaterogiesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
        
        workCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        workCategoriesButton.setTitle("Work", for: .normal)
        workCategoriesButton.tintColor = .white
        workCategoriesButton.layer.cornerRadius = 10
        workCategoriesButton.backgroundColor = Resources.Colors.buttonsCategories.workColor
        workCategoriesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
        
        familyCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        familyCategoriesButton.setTitle("Family", for: .normal)
        familyCategoriesButton.tintColor = .white
        familyCategoriesButton.layer.cornerRadius = 10
        familyCategoriesButton.backgroundColor = Resources.Colors.buttonsCategories.familycolor
        familyCategoriesButton.addTarget(self, action: #selector(tappedOnButton(action:)), for: .touchUpInside)
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
        buttonsCategoriesStackView.addArrangedSubview(homeworkCaterogiesButton)
        buttonsCategoriesStackView.addArrangedSubview(workCategoriesButton)
        buttonsCategoriesStackView.addArrangedSubview(familyCategoriesButton)
        
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
            
            categoriesLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            categoriesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides),
            
            categoriesTextField.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 5),
            categoriesTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            categoriesTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides * 4),
            categoriesTextField.heightAnchor.constraint(equalToConstant: 44),
            categoriesTextField.widthAnchor.constraint(equalToConstant: view.frame.width - constraintOfSides*2),
            
            buttonsCategoriesStackView.topAnchor.constraint(equalTo: categoriesTextField.bottomAnchor, constant: 10),
            buttonsCategoriesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraintOfSides),
            buttonsCategoriesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraintOfSides*4.5),
            buttonsCategoriesStackView.heightAnchor.constraint(equalToConstant: 30)
            
            
        ])
        
    }
    
    @objc func tappedOnButton(action: UIButton){
        
        
        
    }
    
}
