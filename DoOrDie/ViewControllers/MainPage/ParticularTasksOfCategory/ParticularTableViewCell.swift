//
//  ParticularTableViewCell.swift
//  DoOrDie
//
//  Created by m223 on 23.07.2023.
//

import UIKit

class ParticularTableViewCell: UITableViewCell {
    
    static let reuseID = "ParticularTableCell"
    
    let titleOfTask = UILabel()
    let categoryOfTask = UILabel()
    let desciptionOfTask = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        backgroundColor = .red
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        titleOfTask.translatesAutoresizingMaskIntoConstraints = false
        titleOfTask.text = "NoTitle"
        titleOfTask.textColor = .black
        
        categoryOfTask.translatesAutoresizingMaskIntoConstraints = false
        categoryOfTask.text = "NoCategory"
        categoryOfTask.textColor = .black
        
        desciptionOfTask.translatesAutoresizingMaskIntoConstraints = false
        desciptionOfTask.text = "NoDescription"
        desciptionOfTask.textColor = .black
        
    }
    
    private func setupConstraints() {
        addSubview(titleOfTask)
        addSubview(desciptionOfTask)
        
        NSLayoutConstraint.activate([
            titleOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            
            desciptionOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            desciptionOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20)
        ])
        
    }
    
    func configureCell(model: TaskModel){
        
        desciptionOfTask.text = model.descriptionTask
        titleOfTask.text = model.title
    }
    
}
