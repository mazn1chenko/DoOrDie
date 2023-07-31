//
//  ViewController.swift
//  DoOrDie
//
//  Created by m223 on 18.07.2023.
//

import UIKit
import RealmSwift

class MainPageViewController: UIViewController, UISearchBarDelegate {
    
    weak var delegate: MainPageViewControllerDelegate?
    
    let nameUserLabel = UILabel()
    let descriptionLabel = UILabel()
    let meetingsHeaderLabel = UILabel()
    
    let menuButtonNavigationBar = UIButton(type: .system)
    let seeCalendarButton = UIButton(type: .system)
    let addNewTask = UIButton(type: .system)

    let stackView = UIStackView()
    
    let searchBar = UISearchBar()
    
    let tasksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: TasksCollectionViewCell.cellID)
        return collectionView
    }()
    
    let meetingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MeetingsCollectionViewCell.self, forCellWithReuseIdentifier: MeetingsCollectionViewCell.cellID)
        return collectionView
    }()
    
    let backgroundView = UIView()
    
    let girlImageView = UIImageView()
    
    var categoriesInfo = [String : Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupNavigationBar()
        setupViews()
        setupConstraints()
        categoriesInfo = getTasksArrayFromRealm()

    }
    
    private func setupNavigationBar() {
        let customBarButtonItem = UIBarButtonItem(customView: menuButtonNavigationBar)
        navigationItem.leftBarButtonItem = customBarButtonItem
    }
    
    
    //MARK: - setupViews
    private func setupViews() {

        menuButtonNavigationBar.setImage(UIImage(named:"IconMenu"), for: .normal)
        menuButtonNavigationBar.tintColor = .black
        menuButtonNavigationBar.addTarget(self, action: #selector(didTapMenuButton), for: .touchUpInside)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.axis = .vertical
        
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.text = "Hi, NoName!"
        nameUserLabel.font = UIFont(name: "NunitoSans-Bold", size: 28)
        nameUserLabel.textColor = Resources.Colors.blackFontColor
        nameUserLabel.textAlignment = .left
                
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "These are your tasks for today"
        descriptionLabel.font = UIFont(name: "NunitoSans-Light", size: 16)
        descriptionLabel.textColor = Resources.Colors.blackFontColor
        descriptionLabel.textAlignment = .left
        descriptionLabel.contentMode = .top
        descriptionLabel.sizeToFit()
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.applyCommonStyle()
        searchBar.delegate = self
        
        seeCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        seeCalendarButton.setTitle("See calendar", for: .normal)
        seeCalendarButton.setTitleColor(Resources.Colors.blueFont, for: .normal)
        seeCalendarButton.backgroundColor = .white
        seeCalendarButton.titleLabel?.font = UIFont(name: "NunitoSans-Bold", size: 14)
        seeCalendarButton.addTarget(self, action: #selector(getAllCalendar), for: .touchUpInside)
  
        addNewTask.translatesAutoresizingMaskIntoConstraints = false
        addNewTask.setTitle("+ ADD NEW TASK", for: .normal)
        addNewTask.setTitleColor(.white, for: .normal)
        addNewTask.backgroundColor = Resources.Colors.buttonColor
        addNewTask.layer.cornerRadius = 10
        addNewTask.titleLabel?.font = UIFont(name: "NunitoSans-Bold", size: 12)
        addNewTask.addTarget(self, action: #selector(addNewTaskTarget), for: .touchUpInside)
        
        tasksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tasksCollectionView.delegate = self
        tasksCollectionView.dataSource = self
        tasksCollectionView.backgroundColor = .white
        
        meetingsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        meetingsCollectionView.delegate = self
        meetingsCollectionView.dataSource = self
        meetingsCollectionView.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        
        meetingsHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        meetingsHeaderLabel.text = "Meetings"
        meetingsHeaderLabel.font = UIFont(name: "NunitoSans-Black", size: 20)
        meetingsHeaderLabel.textColor = Resources.Colors.blackFontColor
        meetingsHeaderLabel.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        
        girlImageView.translatesAutoresizingMaskIntoConstraints = false
        girlImageView.layer.cornerRadius = 20
        girlImageView.image = UIImage(named: "girl")
    }
    
    //MARK: - setupConstraints
    private func setupConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        view.addSubview(seeCalendarButton)
        view.addSubview(addNewTask)
        view.addSubview(tasksCollectionView)
        view.addSubview(meetingsCollectionView)
        view.addSubview(meetingsHeaderLabel)
        view.addSubview(girlImageView)
        stackView.addArrangedSubview(nameUserLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(searchBar)


        
        let sideConstantLeadingTrailing : CGFloat = 30
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sideConstantLeadingTrailing),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.height / 1.45)),
            
            nameUserLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),

            searchBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstantLeadingTrailing),
            searchBar.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            
            seeCalendarButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            seeCalendarButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sideConstantLeadingTrailing),
                   
            addNewTask.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            addNewTask.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sideConstantLeadingTrailing),
            addNewTask.widthAnchor.constraint(equalToConstant: view.frame.width / 3.5),

            tasksCollectionView.topAnchor.constraint(equalTo: addNewTask.bottomAnchor, constant: 5),
            tasksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tasksCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 3.2),
            
            meetingsCollectionView.topAnchor.constraint(equalTo: meetingsHeaderLabel.bottomAnchor, constant: 10),
            meetingsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            meetingsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            meetingsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            meetingsHeaderLabel.topAnchor.constraint(equalTo: tasksCollectionView.bottomAnchor, constant: 30),
            meetingsHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideConstantLeadingTrailing),
            meetingsHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstantLeadingTrailing),
            
            backgroundView.topAnchor.constraint(equalTo: tasksCollectionView.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            girlImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -44),
            girlImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            girlImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 8),
            girlImageView.widthAnchor.constraint(equalToConstant: view.frame.width / 4.5),
            

            
            ])
    }


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
            reloadDataOnMainVC()
    }
    
    
    func reloadDataOnMainVC() {
        categoriesInfo = getTasksArrayFromRealm()
        tasksCollectionView.reloadData()
    }
    
    //MARK: - Working with Realm and Model

    func getTasksArrayFromRealm() -> [String : Int] {
        do {
            let realm = try Realm()
            let tasksResults = realm.objects(TaskModel.self) // Получаем все таски из базы данных
            
            // Создаем словарь для хранения информации о категориях и количестве элементов
            var categoryInfo: [String: Int] = [:]
            
            // Заполняем словарь, подсчитывая количество элементов для каждой категории
            for task in tasksResults {
                let categoryName = task.categories
                if let count = categoryInfo[categoryName] {
                    categoryInfo[categoryName] = count + 1
                } else {
                    categoryInfo[categoryName] = 1
                }
            }
            
            // Возвращаем полученный словарь
            return categoryInfo
        } catch {
            print("Error fetching tasks: \(error.localizedDescription)")
            return [:]
        }
    }
    
    
    //MARK: - @objc functions actually for addTarget
        
    @objc func didTapMenuButton() {
        
        delegate?.didTapMenuButton()
        
    }
    
    @objc func getAllCalendar() {
        
        navigationController?.pushViewController(CalendarViewController(), animated: true)
        
    }
    
    @objc func addNewTaskTarget() {
        
        navigationController?.pushViewController(AddNewTaskViewController(), animated: true)
    }
    
}

    //MARK: - UISearchBarDelegate
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

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout


extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == tasksCollectionView {
            if categoriesInfo.count != 0 {
                
                return categoriesInfo.keys.count
                
            } else { return 0 }
            
        } else if collectionView == meetingsCollectionView {
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tasksCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCollectionViewCell.cellID, for: indexPath) as! TasksCollectionViewCell
            
            let categoryName = Array(categoriesInfo.keys)[indexPath.row]
            let countOfElements = categoriesInfo[categoryName] ?? 0
            
            cell.configureCell(model: categoryName, count: countOfElements)

            return cell
        } else if collectionView == meetingsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeetingsCollectionViewCell.cellID, for: indexPath) as! MeetingsCollectionViewCell
            cell.layer.cornerRadius = 10
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tasksCollectionView {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height - (collectionView.frame.height * 0.18))
        } else if collectionView == meetingsCollectionView {
            return CGSize(width: collectionView.frame.width - 60, height: collectionView.frame.height / 3.25)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tasksCollectionView {
            return 25
        } else if collectionView == meetingsCollectionView {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ParticularTasksOfCategoryViewController()
        let current = Array(categoriesInfo.keys)[indexPath.row]
        vc.title = current
        navigationController?.pushViewController(vc, animated: true)
    }
}

protocol MainPageViewControllerDelegate: AnyObject {
    func didTapMenuButton()
    
}
