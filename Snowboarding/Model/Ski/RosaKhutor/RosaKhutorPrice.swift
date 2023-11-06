//
//  RosaKhutorPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 18.07.2023.
//

import Foundation

public struct RosaKhutorPrice: Codable {
    var liftName: String
    var cost: String
}

public struct RosaKhutorPriceGroup {
  public let sky: [RosaKhutorPrice]
}

extension RosaKhutorPriceGroup{

    public static func skiShow() -> RosaKhutorPriceGroup{

        let price = [
            RosaKhutorPrice(liftName: "Сезонный ски-пасс", cost: "65 800₽"),
            RosaKhutorPrice(liftName: "Годовой ски-пасс", cost: "75 800₽")

        ]
        return RosaKhutorPriceGroup(sky: price)
    }
}

let one = RosaKhutorPrice(liftName: "Сезонный ски-пасс", cost: "65 800₽")
let two = RosaKhutorPrice(liftName: "Годовой ски-пасс", cost: "75 800₽")
let price = [one, two]
