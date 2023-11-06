//
//  RosaKhutorInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 04.10.2023.
//

import Foundation
import UIKit

public struct InfoGroupRosaKhutor {
  public let sky: [AllInfo]
}

extension InfoGroupRosaKhutor{

    public static func skiInfi() -> InfoGroupRosaKhutor{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "RosaKhutorHotels")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupRosaKhutor(sky: products)
    }
}
