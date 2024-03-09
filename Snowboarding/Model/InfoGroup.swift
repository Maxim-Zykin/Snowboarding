//
//  InfoGroup.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 09.03.2024.
//

import Foundation
import UIKit

public struct InfoGroup {
  public let sky: [AllInfo]
}

extension InfoGroup{

    public static func skiInfi() -> InfoGroup{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "SheregeshHotels")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroup(sky: products)
    }
}
