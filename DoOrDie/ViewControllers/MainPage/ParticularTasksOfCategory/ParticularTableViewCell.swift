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
    let descriptionOfTask = UILabel()
    
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
        titleOfTask.font = UIFont(name: "NunitoSans-Bold", size: 16)
        titleOfTask.textColor = .black
        
        categoryOfTask.translatesAutoresizingMaskIntoConstraints = false
        categoryOfTask.text = "NoCategory"
        categoryOfTask.textColor = .black
        
        descriptionOfTask.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfTask.text = "NoDescription"
        descriptionOfTask.textColor = .black
        descriptionOfTask.font = UIFont(name: "NunitoSans-Light", size: 16)
        descriptionOfTask.numberOfLines = 3
        
        
    }
    
    private func setupConstraints() {
        addSubview(titleOfTask)
        addSubview(descriptionOfTask)
        
        NSLayoutConstraint.activate([
            titleOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            titleOfTask.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            descriptionOfTask.widthAnchor.constraint(equalToConstant: frame.width / 2)
        ])
        
    }
    
    func configureCell(model: TaskModel){
        
        descriptionOfTask.text = model.descriptionTask
        titleOfTask.text = "\(model.title)  (\(model.date))"
    }
    
}


