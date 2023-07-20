//
//  MeetingsCollectionViewCell.swift
//  DoOrDie
//
//  Created by m223 on 20.07.2023.
//

import UIKit


class MeetingsCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CellID"
    
    let nameOfMeetingsLabel = UILabel()
    let descriptionOfMeetingsLabel = UILabel()
    let photoOfPeopleMeetingsImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        
        nameOfMeetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        nameOfMeetingsLabel.text = "Development team"
        nameOfMeetingsLabel.font = UIFont(name: "NunitoSans-Bold", size: 16)
        nameOfMeetingsLabel.textColor = Resources.Colors.blackFontColor
        nameOfMeetingsLabel.numberOfLines = 2
        
        descriptionOfMeetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionOfMeetingsLabel.text = "9:00 AM - 9:45 AM"
        descriptionOfMeetingsLabel.font = UIFont(name: "NunitoSans-Light", size: 13)
        descriptionOfMeetingsLabel.textColor = Resources.Colors.blackFontColor
        descriptionOfMeetingsLabel.numberOfLines = 1
        
        photoOfPeopleMeetingsImageView.translatesAutoresizingMaskIntoConstraints = false
        photoOfPeopleMeetingsImageView.image = UIImage(named: "avatar")
        photoOfPeopleMeetingsImageView.sizeToFit()
        
    }
    
    private func setupConstraints() {
        contentView.addSubview(nameOfMeetingsLabel)
        contentView.addSubview(descriptionOfMeetingsLabel)
        contentView.addSubview(photoOfPeopleMeetingsImageView)
        
        let constantOfSides: CGFloat = 20
        
        NSLayoutConstraint.activate([
            nameOfMeetingsLabel.bottomAnchor.constraint(equalTo: centerYAnchor),
            nameOfMeetingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constantOfSides),
            nameOfMeetingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantOfSides),
            
            descriptionOfMeetingsLabel.topAnchor.constraint(equalTo: centerYAnchor),
            descriptionOfMeetingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constantOfSides),
            descriptionOfMeetingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantOfSides),
            
            photoOfPeopleMeetingsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantOfSides),
            photoOfPeopleMeetingsImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        
        
    }
    
}
