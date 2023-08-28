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
    
    let userDefaults = UserDefaultsManager()
    
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
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navVC = navVC
        
        loginVC.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadInputViews()

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
            mainPageVC.title = "DoOrDie"
        
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
        
        let alert = UIAlertController(title: "You wanna exit?", message: "All your personal data will be deleted", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [self] _ in
            
            let vc = self.loginVC
            
            self.view.addSubview(vc.view)
            self.mainPageVC.view.frame = self.view.frame
            vc.didMove(toParent: self.mainPageVC)

            userDefaults.remove(forKey: UserDefaultsManager.Keys(rawValue: userDefaults.string(forKey: .nameOfUser)!) ?? .nameOfUser)

        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
            
        }))

        self.present(alert, animated: true, completion: nil)
        
        RealmStorageManager.shared.cleanAllData()
        
    }
    

}

extension MainPageContainerViewController: LogInViewControllerDelegate {
    
    func tapTheLoginButton() {
        loginVC.view.removeFromSuperview()
        basketVC.view.removeFromSuperview()
        accountVC.view.removeFromSuperview()
        basketVC.didMove(toParent: nil)
        accountVC.didMove(toParent: nil)
        loginVC.didMove(toParent: nil)
        mainPageVC.nameUserLabel.text = "Hi, \(userDefaults.string(forKey: .nameOfUser) ?? "Hi, NoName")"
        loginVC.navigationController?.pushViewController(MainPageContainerViewController(), animated: true)
        
    }
}
