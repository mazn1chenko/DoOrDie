//
//  MenuOnMainPageView.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit

class MenuViewController: UIViewController{
    
    let menuTableView = UITableView()
    
    var closeMenuButton = UIButton(type: .system)
    
    var cellOfTable = ["Basket", "Account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        menuTableView.register(CellForMenuTableView.self, forCellReuseIdentifier: CellForMenuTableView.reuseID)
        
    }
    
    private func setupConstraints() {
        view.addSubview(menuTableView)
        view.addSubview(closeMenuButton)
        
        
        NSLayoutConstraint.activate([
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            menuTableView.widthAnchor.constraint(equalToConstant: view.frame.width - 100),
            menuTableView.heightAnchor.constraint(equalToConstant: view.frame.height)
            
        ])
        
    }
    
    
}


//MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellOfTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellForMenuTableView.reuseID, for: indexPath) as! CellForMenuTableView
        cell.configureCell(model: cellOfTable[indexPath.row])
        return cell
    }
    
    
    
}

//MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
                let vc = BasketPageViewController()
                navigationController?.pushViewController(vc, animated: true)
        case 1:
                let vc = BasketPageViewController()
                navigationController?.pushViewController(vc, animated: true)
        default:
            print("1")
        }
    }
    
}
