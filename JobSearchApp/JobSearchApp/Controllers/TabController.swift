//
//  TabController.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

protocol TabBarActivated {
    func tabBarIsActivated(_ bool: Bool)
}

class TabController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTabs()
        tabBarIsActivated(false)

        self.view.backgroundColor = .white
        self.tabBar.barTintColor = .gray
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = .black
        
    }
    
    //MARK: - Tab Setup
    private func setupTabs() {
        let search = self.createNav(with: "Поиск", and: UIImage(named: "ic-search"), vc: SearchController())
        let favorite = self.createNav(with: "Избранное", and: UIImage(named: "ic-favourites"), vc: FavoritesController())
        let response = self.createNav(with: "Отклики", and: UIImage(named: "ic-responses"), vc: ResponsesController())
        let message = self.createNav(with: "Сообщения", and: UIImage(named: "ic-message"), vc: MessagesController())
        let account = self.createNav(with: "Профиль", and: UIImage(named:"ic-account"), vc: AccountController())
        
        self.setViewControllers([search, favorite, response, message, account], animated: true)
        
    }
    
   
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let vC = ViewController()
        let nav = UINavigationController(rootViewController: vC)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
    //  nav.viewControllers.first?.navigationItem.title = title + " Controller"
//        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
}

extension TabController: TabBarActivated {
    
    func tabBarIsActivated(_ bool: Bool) {
        var allButtonsPressed = bool {
            didSet {
                if let items = tabBarController?.tabBar.items {
                    items[0].isEnabled = allButtonsPressed
                    items[1].isEnabled = allButtonsPressed
                    items[2].isEnabled = allButtonsPressed
                    items[3].isEnabled = allButtonsPressed
                    items[4].isEnabled = allButtonsPressed
                }
            }
        }
      //  allButtonsPressed = bool
    }
}
