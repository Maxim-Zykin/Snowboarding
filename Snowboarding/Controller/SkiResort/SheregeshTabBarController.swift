//
//  SheregeshTabBarController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 01.06.2023.
//

import UIKit

class SheregeshTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Шерегеш"
        tabBar.backgroundColor = .white
        createTabBar()
    }
    
    private func createTabBar() {
        viewControllers = [
            createVC(viewController: SheregeshInfoController(), title: "О курорте", image: UIImage(named: "infoSR")),
            createVC(viewController: PriceTableViewController(costModel: priceSheregesh), title: "Цены", image: UIImage(named: "priseSR")),
            createVC(viewController: SheregeshTimeWorkController(), title: "Режим работы", image: UIImage(named: "timeWorkSR"))
        ]
    }

    private func createVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
