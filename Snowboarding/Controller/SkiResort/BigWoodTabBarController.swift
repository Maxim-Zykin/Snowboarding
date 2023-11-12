//
//  BigWoodTabBarController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.11.2023.
//

import UIKit

class BigWoodTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        navigationItem.title = "Большой Вудъявр"
        createTabBar()
    }
    
    private func createTabBar() {
        viewControllers = [
            createVC(viewController: BigWoodInfoViewController(), title: "О курорте", image: UIImage(named: "infoSR")),
            createVC(viewController: PriceTableViewController(costModel: allPriceBigWood), title: "Цены", image: UIImage(named: "priseSR")),
            createVC(viewController: TimeTableViewController(timeWorkModel: allTimeWorkBigWood), title: "Режим работы", image: UIImage(named: "timeWorkSR"))
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) ->UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
