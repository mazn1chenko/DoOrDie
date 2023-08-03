//
//  BasketPageViewController.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit
import RealmSwift

class BasketPageViewController: UIViewController {
    
    let deletedTasksTableView = UITableView()
    
    lazy var deletedTasksArray: [TaskModel] = {
        
            let array = getTasksArrayFromRealm()
        
            return array
    }()
    
    var filteredArray = [TaskModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Basket"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Resources.Colors.blackFontColor]

        
        setupViews()
        setupConstraints()
        filteringArray()
    }
    
    private func setupViews() {
        
        deletedTasksTableView.translatesAutoresizingMaskIntoConstraints = false
        deletedTasksTableView.backgroundColor = .white
        deletedTasksTableView.dataSource = self
        deletedTasksTableView.delegate = self
        deletedTasksTableView.register(DeletedTasksCell.self, forCellReuseIdentifier: DeletedTasksCell.reuseID)
        
    }
    
    private func setupConstraints() {
        view.addSubview(deletedTasksTableView)
        
        NSLayoutConstraint.activate([
            deletedTasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            deletedTasksTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            deletedTasksTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            deletedTasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private func filteringArray() {
        
        if deletedTasksArray.count != 0 {
            
            for i in deletedTasksArray {
                if i.isDone == true {
                    filteredArray.append(i)
                }
            }
        }
        deletedTasksTableView.reloadData()
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
            deletedTasksTableView.reloadData()
    }
}

extension BasketPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 8
    }
    
}

extension BasketPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeletedTasksCell.reuseID, for: indexPath) as! DeletedTasksCell
        cell.configureCell(model: filteredArray[indexPath.row])
        return cell
    }
    
    
    
}
