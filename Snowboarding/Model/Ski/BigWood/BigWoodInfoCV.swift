//
//  BigWoodInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.11.2023.
//

import Foundation
import UIKit


public struct InfoGroupBigWood {
  public let sky: [AllInfo]
}

extension InfoGroupBigWood{

    public static func skiInfi() -> InfoGroupBigWood{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "lesnaya2")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupBigWood(sky: products)
    }
}
