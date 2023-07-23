//
//  ParticularTableViewCell.swift
//  DoOrDie
//
//  Created by m223 on 23.07.2023.
//

import UIKit

class ParticularTableViewCell: UITableViewCell {
    
    static let reuseID = "ParticularTableCell"
    
    let label = UILabel()
    
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
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOL"
        label.textColor = .black
        
    }
    
    private func setupConstraints() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    func configureCell(model: TaskModel){
        
        label.text = model.title
    }
    
}
