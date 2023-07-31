//
//  MainPageContainerViewController.swift
//  DoOrDie
//
//  Created by m223 on 31.07.2023.
//

import UIKit

class MainPageContainerViewController: UIViewController {
    
    enum MenuState {
        
        case opened
        case closed
        
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    
    let mainPageVC = MainPageViewController()
    
    var navVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVCs()
    }
    
    private func addChildVCs() {
        
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)

        
        mainPageVC.delegate = self
        let navVC = UINavigationController(rootViewController: mainPageVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC

    }
}

extension MainPageContainerViewController: MainPageViewControllerDelegate{
    func didTapMenuButton() {
        
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.mainPageVC.view.frame.width - 100
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                    
                }
                
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self]done in
                if done {
                    self?.menuState = .closed
                    
                }
                
            }
        }
    }
}
