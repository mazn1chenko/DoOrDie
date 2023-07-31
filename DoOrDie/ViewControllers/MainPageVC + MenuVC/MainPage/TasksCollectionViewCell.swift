//
//  TasksCollectionViewCell.swift
//  DoOrDie
//
//  Created by m223 on 20.07.2023.
//

import UIKit

class TasksCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CellID"
    
    let nameOfTasksLabel = UILabel()
    let countOfTasksLabel = UILabel()
    
    let square1View = UIView()
    let square2View = UIView()
    let fakeSeparatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        setupViews()
        setupConstraints()
        backgroundColor = Resources.Colors.tasksCollectionCellColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        
        nameOfTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfTasksLabel.text = "Landing page design"
        nameOfTasksLabel.font = UIFont(name: "NunitoSans-Bold", size: 16)
        nameOfTasksLabel.numberOfLines = 2
        
        countOfTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        countOfTasksLabel.text = "10 tasks"
        countOfTasksLabel.font = UIFont(name: "NunitoSans-Light", size: 13)
        countOfTasksLabel.numberOfLines = 1
        
        square1View.translatesAutoresizingMaskIntoConstraints = false
        square1View.backgroundColor = Resources.Colors.squareColor
        
        square2View.translatesAutoresizingMaskIntoConstraints = false
        square2View.backgroundColor = Resources.Colors.squareColor
        
        fakeSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        fakeSeparatorView.backgroundColor = .white

    }
    
    private func setupConstraints() {
        contentView.addSubview(square1View)
        contentView.addSubview(square2View)
        contentView.addSubview(nameOfTasksLabel)
        contentView.addSubview(countOfTasksLabel)
        contentView.addSubview(fakeSeparatorView)
        
        NSLayoutConstraint.activate([
            nameOfTasksLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfTasksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameOfTasksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            countOfTasksLabel.topAnchor.constraint(equalTo: nameOfTasksLabel.bottomAnchor, constant: 3),
            countOfTasksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            countOfTasksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            square1View.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            square1View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            square1View.heightAnchor.constraint(equalToConstant: frame.height / 2),
            square1View.widthAnchor.constraint(equalToConstant: frame.width / 2),
            
            square2View.bottomAnchor.constraint(equalTo: bottomAnchor),
            square2View.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            square2View.heightAnchor.constraint(equalToConstant: frame.height / 3.5),
            square2View.widthAnchor.constraint(equalToConstant: frame.width / 2),
            
            fakeSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fakeSeparatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            fakeSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fakeSeparatorView.heightAnchor.constraint(equalToConstant: 3),
            fakeSeparatorView.widthAnchor.constraint(equalToConstant: frame.width - 20)
            
        ])
    }
    
    func configureCell(model: String, count: Int){
        
        nameOfTasksLabel.text = model
        countOfTasksLabel.text = "\(count) tasks"
        
    }
    
}
