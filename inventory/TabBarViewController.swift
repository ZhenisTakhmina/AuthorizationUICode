//
//  TabBarViewController.swift
//  inventory
//
//  Created by Tami on 06.01.2024.
//

import UIKit
import SnapKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBars()
    }
    
    private func setupTabBars() {
        let profileViewController = ProfileViewController()
        let mainViewController = MainViewController()
        let stockViewController = StockViewController()
        let summaryViewController = SummaryViewController()
        
        mainViewController.tabBarItem = UITabBarItem(
            title: "Главная",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house"))
        
        stockViewController.tabBarItem = UITabBarItem(
            title: "Склад",
            image: UIImage(systemName: "magazine"),
            selectedImage: UIImage(systemName: "magazine"))
        
        summaryViewController.tabBarItem = UITabBarItem(
            title: "Итог",
            image: UIImage(systemName: "calendar"),
            selectedImage: UIImage(systemName: "calendar"))
        
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person"))
        
        self.viewControllers = [mainViewController,stockViewController,summaryViewController,profileViewController]
        
    }

}
