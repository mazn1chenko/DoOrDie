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
        
    var basketVC = BasketPageViewController()
    
    var accountVC = AccountPageViewController()
    
    var loginVC = LogInViewController()
    
    var navVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVCs()
    }
    
    private func addChildVCs() {
        
        menuVC.delegate = self
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
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?){
        
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
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()

                    }
                }
                
            }
        }
    }
}

extension MainPageContainerViewController: MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu(completion: nil)
        switch menuItem {
            
        case .mainPage:
            self.openMainPage()
        case .basket:
            self.openBasketPage()
        case .account:
            self.openAccountPage()
        case .exit:
            self.exitFromAccount()
        }

        
    }
    
    private func openMainPage() {
            basketVC.view.removeFromSuperview()
            accountVC.view.removeFromSuperview()
            basketVC.didMove(toParent: nil)
            accountVC.didMove(toParent: nil)
            mainPageVC.title = "MainPage"
        
    }
    
    private func openBasketPage() {
        
        let vc = basketVC
        
        mainPageVC.addChild(vc)
        mainPageVC.view.addSubview(vc.view)
        mainPageVC.view.frame = view.frame
        vc.didMove(toParent: mainPageVC)
        mainPageVC.title = vc.title
    }
    
    private func openAccountPage() {
                
        let vc = accountVC
        
        mainPageVC.addChild(vc)
        mainPageVC.view.addSubview(vc.view)
        mainPageVC.view.frame = view.frame
        vc.didMove(toParent: mainPageVC)
        mainPageVC.title = vc.title
    }
    
    private func exitFromAccount() {
        
        let alert = UIAlertController(title: "You wanna exit?", message: "Exit from account", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            
            let vc = self.loginVC
            
            self.mainPageVC.view.addSubview(vc.view)
            self.mainPageVC.view.frame = self.view.frame
            vc.didMove(toParent: self.mainPageVC)
            self.mainPageVC.title = vc.title

            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
            
        }))

        self.present(alert, animated: true, completion: nil)    }
    

}
