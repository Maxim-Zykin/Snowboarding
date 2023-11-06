//
//  ArhyzPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 19.07.2023.
//

import Foundation

public struct ArhyzPrice {
    let liftName: String
    let cost: String
}

public struct ArhyzPriceGroup {
  public let sky: [ArhyzPrice]
}

extension ArhyzPriceGroup{

    public static func skiShow() -> ArhyzPriceGroup{

        let price = [
            ArhyzPrice(liftName: "Сезонный ски-пасс зима 2023/2024", cost: "31500 ₽"),
            ArhyzPrice(liftName: "10 дней в зимнем сезоне 23/24", cost: "16300 ₽"),
            ArhyzPrice(liftName: "7 дней в зимнем сезоне 23/24", cost: "12000 ₽")
        ]
        return ArhyzPriceGroup(sky: price)
    }
}
