//
//  CellForMenuTableView.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit

class CellForMenuTableView: UITableViewCell {
    
    static let reuseID = "CellForMenuTableView"
    
    let nameOfPageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Resources.Colors.tasksCollectionCellColor
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameOfPageLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfPageLabel.text = "NoData"
        nameOfPageLabel.font = UIFont(name: "NunitoSans-Bold", size: 16)
        nameOfPageLabel.textColor = Resources.Colors.blackFontColor
        

    }
    
    private func setupConstraints() {
        addSubview(nameOfPageLabel)
        
        NSLayoutConstraint.activate([
            nameOfPageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfPageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    func configureCell(model: String) {
        
        nameOfPageLabel.text = model
        
    }
}
