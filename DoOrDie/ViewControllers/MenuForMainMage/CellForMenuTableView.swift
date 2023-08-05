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
    
    let imageOfCell = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Resources.Colors.blueFont
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
        //nameOfPageLabel.textColor = Resources.Colors.blackFontColor
        nameOfPageLabel.textColor = .black
        
        imageOfCell.translatesAutoresizingMaskIntoConstraints = false
        imageOfCell.tintColor = .black
    }
    
    private func setupConstraints() {
        addSubview(nameOfPageLabel)
        addSubview(imageOfCell)
        
        NSLayoutConstraint.activate([
            nameOfPageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameOfPageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageOfCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageOfCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageOfCell.heightAnchor.constraint(equalToConstant: 25),
            imageOfCell.widthAnchor.constraint(equalToConstant: 25)
        ])
        
    }
    
    func configureCell(title: String, image: String) {
        
        nameOfPageLabel.text = title
        
        imageOfCell.image = UIImage(named: image)
        imageOfCell.tintColor = .white
    }
}
