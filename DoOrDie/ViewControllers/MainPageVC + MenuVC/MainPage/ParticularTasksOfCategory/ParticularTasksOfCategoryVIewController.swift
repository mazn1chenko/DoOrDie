//
//  ParticularTasksOfCategoryVIewController.swift
//  DoOrDie
//
//  Created by m223 on 23.07.2023.
//

import UIKit
import RealmSwift

protocol ParticularTasksOfCategoryViewControllerDelegate: AnyObject {
    
    func closeVC()
}

class ParticularTasksOfCategoryViewController: UIViewController {
    
    weak var delegate: ParticularTasksOfCategoryViewControllerDelegate?
        
    let tasksTableView = UITableView()
    
    lazy var tasksArray: [TaskModel] = {
            return getTasksArrayFromRealm()
        }()
    
    var filteredArray = [TaskModel]()
    
    var realmManager = RealmStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Resources.Colors.blackFontColor]

        setupViews()
        setupConstraints()
        filteringArray()
    }
    
    private func setupViews() {
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        
        tasksTableView.register(ParticularTableViewCell.self, forCellReuseIdentifier: ParticularTableViewCell.reuseID)
        
    }
    
    private func setupConstraints() {
        view.addSubview(tasksTableView)
        
        NSLayoutConstraint.activate([
            
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
        
    }
    
    private func getTasksArrayFromRealm() -> [TaskModel] {
        do {
            let realm = try Realm()
            let tasksResults = realm.objects(TaskModel.self)
            return Array(tasksResults)
        } catch {
            print("Error fetching tasks: \(error.localizedDescription)")
            return []
        }
    }
    
    private func filteringArray() {
        
        if tasksArray.count != 0 {
            for i in tasksArray {
                if i.categories == title{
                    if i.isDone != true {
                        filteredArray.append(i)
                    }
                }
            }
        }
        tasksTableView.reloadData()
        
    }
    
    private func handleSwipeToDelete(at indexPath: IndexPath) {
        let taskToDelete = filteredArray[indexPath.row]

        
        realmManager.addTaskToRealm(title: taskToDelete.title, date: taskToDelete.date, category: taskToDelete.categories, team: taskToDelete.team, description: taskToDelete.descriptionTask, isDone: true)
        

        realmManager.deleteTaskFromRealm(taskToDelete)
        
        filteredArray.remove(at: indexPath.row)
        
        tasksTableView.deleteRows(at: [indexPath], with: .fade)
        
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            
            delegate?.closeVC()
        }
    }

    
}

//MARK: - UITableViewDelegate
extension ParticularTasksOfCategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 8
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            handleSwipeToDelete(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - UITableViewDataSource
extension ParticularTasksOfCategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredArray.count != 0 {
            return filteredArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticularTableViewCell.reuseID, for: indexPath) as! ParticularTableViewCell
        cell.backgroundColor = Resources.Colors.tasksCollectionCellColor
        
        cell.configureCell(model: filteredArray[indexPath.row])
        return cell
        
    }
}

