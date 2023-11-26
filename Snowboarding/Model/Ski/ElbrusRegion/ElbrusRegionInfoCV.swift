//
//  ElbrusRegionInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.11.2023.
//

import Foundation
import UIKit

public struct InfoGroupElbrusRegion {
  public let sky: [AllInfo]
}

extension InfoGroupElbrusRegion{

    public static func skiInfi() -> InfoGroupElbrusRegion{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "alpina")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupElbrusRegion(sky: products)
    }
}
