//
//  ElbrusRegionTabBarController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.11.2023.
//

import UIKit

class ElbrusRegionTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        navigationItem.title = "Приэльбрусье"
        createTabBar()
    }
    
    private func createTabBar() {
        viewControllers = [
            createVC(viewController: ElbrusRegionInfoViewController(), title: "О курорте", image: UIImage(named: "infoSR")),
            createVC(viewController: PriceTableViewController(costModel: allPriceElbrusRegion), title: "Цены", image: UIImage(named: "priseSR")),
            createVC(viewController: TimeTableViewController(timeWorkModel: allTimeWorkBigWood), title: "Режим работы", image: UIImage(named: "timeWorkSR"))
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String, image: UIImage?) ->UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
