//
//  SkiResorts.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.04.2023.
//

import Foundation
import UIKit

public struct AllSkiResorts {
    let name: String
    let image: UIImage
}

public struct SkiResortsGroup {
  public let sky: [AllSkiResorts]
}

extension SkiResortsGroup{

    public static func skiShow() -> SkiResortsGroup{

        let products = [
            AllSkiResorts(name: "Шерегеш", image: UIImage(named: "sheregeshLogo")!),
            AllSkiResorts(name: "Роза Хутор", image: UIImage(named: "rosakhutorLogo")!),
            AllSkiResorts(name: "Архыз", image: UIImage(named: "arhyz")!),
            AllSkiResorts(name: "Домбай", image: UIImage(named: "dombai")!),
            AllSkiResorts(name: "Большой Вудъявр", image: UIImage(named: "bigWood")!),
            AllSkiResorts(name: "Приэльбрусье", image: UIImage(named: "elb")!)
        ]
        return SkiResortsGroup(sky: products)
    }
}
