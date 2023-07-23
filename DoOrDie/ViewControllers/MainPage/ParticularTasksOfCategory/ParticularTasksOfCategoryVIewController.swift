//
//  ParticularTasksOfCategoryVIewController.swift
//  DoOrDie
//
//  Created by m223 on 23.07.2023.
//

import UIKit
import RealmSwift

class ParticularTasksOfCategoryViewController: UIViewController {
    
    let tasksTableView = UITableView()
    
    lazy var tasksArray: [TaskModel] = {
            return getTasksArrayFromRealm()
        }()
    
    var filteredArray = [TaskModel]()
    
    
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
    
    func getTasksArrayFromRealm() -> [TaskModel] {
        do {
            let realm = try Realm()
            let tasksResults = realm.objects(TaskModel.self)
            return Array(tasksResults)
        } catch {
            print("Error fetching tasks: \(error.localizedDescription)")
            return []
        }
    }
    
    func filteringArray() {
        
        if tasksArray.count != 0 {
            for i in tasksArray {
                if i.categories == title{
                    filteredArray.append(i)
                }
            }
        }
        tasksTableView.reloadData()
        
    }

    
}

//MARK: - UITableViewDelegate
extension ParticularTasksOfCategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 10
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
