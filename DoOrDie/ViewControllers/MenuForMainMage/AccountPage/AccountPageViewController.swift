//
//  AccountPageViewController.swift
//  DoOrDie
//
//  Created by m223 on 01.08.2023.
//

import UIKit

class AccountPageViewController: UIViewController {
    
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .yellow
        title = "Account"

        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        
        label.center = view.center
        label.text = "LOL"
        label.textColor = .black
        
    }
    
    private func setupConstraints() {
        view.addSubview(label)
        
    }
}
