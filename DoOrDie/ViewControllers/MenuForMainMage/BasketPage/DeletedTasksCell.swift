//
//  DeletedTasksCell.swift
//  DoOrDie
//
//  Created by m223 on 26.07.2023.
//

import UIKit

class DeletedTasksCell: UITableViewCell {
    
    static let reuseID = "DeletedTasksCell"
    
    let titleOfTaskLabel = UILabel()
    let dateOfTaskLabel = UILabel()
    let descriptionOfTaskLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        titleOfTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        titleOfTaskLabel.text = "NoTitle"
        titleOfTaskLabel.font = UIFont(name: "NunitoSans-Bold", size: 18)
        titleOfTaskLabel.textColor = Resources.Colors.blackFontColor
        
        descriptionOfTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfTaskLabel.text = "NoDescription"
        descriptionOfTaskLabel.textColor = Resources.Colors.blackFontColor
        descriptionOfTaskLabel.font = UIFont(name: "NunitoSans-Light", size: 18)
        descriptionOfTaskLabel.numberOfLines = 3

    }
    
    private func setupConstraints() {
        addSubview(titleOfTaskLabel)
        addSubview(descriptionOfTaskLabel)
        addSubview(dateOfTaskLabel)

        
        NSLayoutConstraint.activate([
            titleOfTaskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleOfTaskLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            titleOfTaskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            descriptionOfTaskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionOfTaskLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            descriptionOfTaskLabel.widthAnchor.constraint(equalToConstant: frame.width / 2),
            
        ])
    }
    
    func configureCell(model: TaskModel){
        
        titleOfTaskLabel.text = "\(model.title)  (\(model.date))"
        descriptionOfTaskLabel.text = model.descriptionTask
        
    }
}
