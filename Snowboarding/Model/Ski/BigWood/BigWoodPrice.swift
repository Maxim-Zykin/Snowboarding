//
//  BigWoodPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.11.2023.
//

import Foundation

import Foundation

public struct BigWoodPrice {
    let liftName: String
    let cost: String
}

public struct BigWoodPriceGroup {
  public let sky: [BigWoodPrice]
}

extension BigWoodPriceGroup{

    public static func skiShow() -> BigWoodPriceGroup{

        let price = [
            BigWoodPrice(liftName: "Низкий сезон: 04.12.23 - 24.12.23, 09.01.24 - 21.02.23, 13.05.24 - 19.05.24 - 2 часа", cost: "1200 ₽"),
            BigWoodPrice(liftName: "Низкий сезон: 04.12.23 - 24.12.23, 09.01.24 - 21.02.23, 13.05.24 - 19.05.24 - 1 день", cost: "2150 ₽"),
            BigWoodPrice(liftName: "Пиковый сезон: 25.12.23 - 08.01.24, 07.03.24 - 12.05.24 - 4 часа", cost: "2400 ₽"),
            BigWoodPrice(liftName: "Пиковый сезон: 25.12.23 - 08.01.24, 07.03.24 - 12.05.24 - 1 день", cost: "3200 ₽"),
            BigWoodPrice(liftName: "Высокий сезон: 22.02.24 - 06.03.24 - 4 часа", cost: "1950 ₽"),
            BigWoodPrice(liftName: "Высокий сезон: 22.02.24 - 06.03.24 - 1 день", cost: "2600 ₽")
        ]
        return BigWoodPriceGroup(sky: price)
    }
}
