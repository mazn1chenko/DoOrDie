//
//  MenuOnMainPageView.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    
    func didSelect(menuItem: MenuViewController.MenuOptions)
    
}

class MenuViewController: UIViewController{
    
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuOptions: String, CaseIterable {
        
        case mainPage  = "DoOrDie"
        case basket = "Basket"
        case account = "Account"
        case exit = "Exit"
        
        var image: String {
            
            switch self {
            case .mainPage:
                return "DoOrDie"
            case .basket:
                return "basket"
            case .account:
                return "account"
            case .exit:
                return "exit"
            }
        }
        
    }
    
    let menuTableView = UITableView()
    
    var closeMenuButton = UIButton(type: .system)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resources.Colors.blueFont
        
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = Resources.Colors.blueFont
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
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellForMenuTableView.reuseID, for: indexPath) as! CellForMenuTableView
        cell.configureCell(title: MenuOptions.allCases[indexPath.row].rawValue, image: MenuOptions.allCases[indexPath.row].image)
        return cell
    }
    
    
    
}

//MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
    
}
