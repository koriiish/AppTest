//
//  FavoritesViewController.swift
//  JobSearchApp
//
//  Created by Карина Дьячина on 18.03.24.
//

import UIKit

class FavoritesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    tabBarIsActivated(false)
    }
}
extension FavoritesController: TabBarActivated {
    
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
       // allButtonsPressed = bool
    }
}
