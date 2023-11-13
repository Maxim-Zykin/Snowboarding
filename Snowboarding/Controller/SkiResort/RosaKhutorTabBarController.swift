//
//  RosaKhutorTabBarController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 02.06.2023.
//

import UIKit

class RosaKhutorTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        navigationItem.title = "Роза Хутор"
        createTabBar()
    }

    private func createTabBar() {
        viewControllers = [
            createVC(viewController: RosaKhutorInfoController(), title: "О курорте", image: UIImage(named: "infoSR")),
            createVC(viewController: PriceTableViewController(costModel: priceRosaKhutor), title: "Цены", image: UIImage(named: "priseSR")),
            createVC(viewController: RosaKhutorTimeWorkController(), title: "Режим работы", image: UIImage(named: "timeWorkSR"))
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) ->UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
