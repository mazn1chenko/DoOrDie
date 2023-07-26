//
//  MenuOnMainPageView.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit

class MenuOnMainPageView: UIView{
    
    let menuTableView = UITableView()
    
    weak var navigationController: UINavigationController?
    
    let closeMenuButton = UIButton(type: .system)
    
    var cellOfTable = ["Basket", "Account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupViews() {

        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.layer.cornerRadius = 10
        menuTableView.backgroundColor = Resources.Colors.mettingsCollectionViewBackgroundColor
        menuTableView.register(CellForMenuTableView.self, forCellReuseIdentifier: CellForMenuTableView.reuseID)
        
        closeMenuButton.translatesAutoresizingMaskIntoConstraints = false
        closeMenuButton.setImage(UIImage(named: "closeButton"), for: .normal)
        
    }
    
    private func setupConstraints() {
        addSubview(menuTableView)
        addSubview(closeMenuButton)
        
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeMenuButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeMenuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            closeMenuButton.heightAnchor.constraint(equalToConstant: 25),
            closeMenuButton.widthAnchor.constraint(equalToConstant: 25)
            
            
        ])
        
    }
    
}

//MARK: - UITableViewDataSource
extension MenuOnMainPageView: UITableViewDataSource {
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
extension MenuOnMainPageView: UITableViewDelegate {
    
    
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
