//
//  DombaiInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 21.09.2023.
//

import Foundation
import UIKit


public struct InfoGroupDombai {
  public let sky: [AllInfo]
}

extension InfoGroupDombai{

    public static func skiInfi() -> InfoGroupDombai{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "DombayHotels")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupDombai(sky: products)
    }
}
