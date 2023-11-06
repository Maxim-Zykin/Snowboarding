//
//  SheregeshInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 13.09.2023.
//

import Foundation
import UIKit

public struct AllInfo {
    let name: String
    let image: UIImage
}

public struct InfoGroupSheregesh {
  public let sky: [AllInfo]
}

extension InfoGroupSheregesh{

    public static func skiInfi() -> InfoGroupSheregesh{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "SheregeshHotels")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupSheregesh(sky: products)
    }
}
