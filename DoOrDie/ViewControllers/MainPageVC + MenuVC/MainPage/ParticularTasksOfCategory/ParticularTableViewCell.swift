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
    
    let doneTaskButton = UIButton(type: .system)
    let editTaskButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
            // backgroundColor = Resources.Colors.tasksCollectionCellColor

        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        titleOfTask.translatesAutoresizingMaskIntoConstraints = false
        titleOfTask.text = "NoTitle"
        titleOfTask.font = UIFont(name: "NunitoSans-Bold", size: 18)
        titleOfTask.textColor = Resources.Colors.blackFontColor
        
        descriptionOfTask.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfTask.text = "NoDescription"
        descriptionOfTask.textColor = Resources.Colors.blackFontColor
        descriptionOfTask.font = UIFont(name: "NunitoSans-Light", size: 18)
        descriptionOfTask.numberOfLines = 3
        
        doneTaskButton.translatesAutoresizingMaskIntoConstraints = false
        doneTaskButton.setImage(UIImage(named: "done"), for: .normal)
        doneTaskButton.tintColor = Resources.Colors.blackFontColor
//        doneTaskButton.layer.zPosition = 1
        
        editTaskButton.translatesAutoresizingMaskIntoConstraints = false
        editTaskButton.setImage(UIImage(named: "editButton"), for: .normal)
        editTaskButton.tintColor = Resources.Colors.blackFontColor
//        editTaskButton.addTarget(self, action: #selector(edit), for: .touchUpInside)

        
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleOfTask)
        contentView.addSubview(descriptionOfTask)
        contentView.addSubview(doneTaskButton)
        contentView.addSubview(editTaskButton)
        
        NSLayoutConstraint.activate([
            titleOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            titleOfTask.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            descriptionOfTask.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionOfTask.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            descriptionOfTask.widthAnchor.constraint(equalToConstant: frame.width / 2),
            
            doneTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            doneTaskButton.topAnchor.constraint(equalTo: titleOfTask.topAnchor, constant: 5),
            doneTaskButton.bottomAnchor.constraint(equalTo: titleOfTask.bottomAnchor, constant: -5),
            doneTaskButton.widthAnchor.constraint(equalToConstant: 30),
            
            editTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            editTaskButton.topAnchor.constraint(equalTo: descriptionOfTask.topAnchor, constant: 5),
            editTaskButton.bottomAnchor.constraint(equalTo: descriptionOfTask.bottomAnchor, constant: -5),
            
        ])
        
    }
    
    func configureCell(model: TaskModel){
        
        descriptionOfTask.text = model.descriptionTask
        titleOfTask.text = "\(model.title)  (\(model.date))"
    }
    
}


