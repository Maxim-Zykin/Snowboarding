//
//  DombaiPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 19.07.2023.
//

import Foundation

public struct DombaiPrice {
    let liftName: String
    let cost: String
}

public struct DombaiPriceGroup {
  public let sky: [DombaiPrice]
}

extension DombaiPriceGroup{

    public static func skiShow() -> DombaiPriceGroup{

        let price = [
            DombaiPrice(liftName: "1 подъём/спуск на 1 очередь", cost: "500 ₽"),
            DombaiPrice(liftName: "1 подъём/спуск на 1+2 очереди", cost: "1000 ₽"),
            DombaiPrice(liftName: "1 подъём/спуск на 1+2+3 очереди", cost: "1150 ₽"),
            DombaiPrice(liftName: "1 подъём/спуск на 2+3 очереди", cost: "650 ₽"),
            DombaiPrice(liftName: "Единый ски-пасс 1 день", cost: "2000 ₽")
        ]
        return DombaiPriceGroup(sky: price)
    }
}
