//
//  SheregeshPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 18.07.2023.
//

import Foundation

public struct SheregeshPrice {
    let liftName: String
    let cost: String
}

public struct SheregeshPriceGroup {
  public let sky: [SheregeshPrice]
}

extension SheregeshPriceGroup{

    public static func skiShow() -> SheregeshPriceGroup{

        let price = [
            SheregeshPrice(liftName: "Единый ски-пасс 1 день", cost: "2645 ₽"),
            SheregeshPrice(liftName: "Единый ски-пасс 2 дня", cost: "4800 ₽"),
            SheregeshPrice(liftName: "Единый ски-пасс 3 дня", cost: "7000 ₽"),
            SheregeshPrice(liftName: "Единый ски-пасс 4 дня", cost: "8850 ₽"),
            SheregeshPrice(liftName: "Единый ски-пасс 5 дней", cost: "11000 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 4 часа", cost: "1725 ₽"),
            
            SheregeshPrice(liftName: "Каскад Ски-пасс 1 день", cost: "2415 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 2 дня", cost: "4315 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 3 дня", cost: "6270 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 4 дня", cost: "7900 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 5 дней", cost: "9850 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 6 дней", cost: "11800 ₽"),
            SheregeshPrice(liftName: "Каскад Ски-пасс 7 дней", cost: "13800 ₽"),
            
            SheregeshPrice(liftName: "Каскад Бугель нижний БКД-39", cost: "100 ₽"),
            SheregeshPrice(liftName: "Каскад Бугель верхний БКД-40", cost: "100 ₽"),
            SheregeshPrice(liftName: "Каскад 2х кресло «Синее кресло»", cost: "160 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Учебная»", cost: "245 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Булочка»", cost: "245 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Запад»", cost: "245 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Хлебница»", cost: "310 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Олимпия-Экспресс»", cost: "310 ₽"),
            SheregeshPrice(liftName: "Каскад 4х кресло «Мустаг»", cost: "310 ₽"),
            SheregeshPrice(liftName: "Каскад 6х кресло «Восток»", cost: "310 ₽"),
            SheregeshPrice(liftName: "Каскад Траволатор", cost: "115 ₽"),
            
            SheregeshPrice(liftName: "Сектор Е Ски-пасс 1 день", cost: "2250 ₽"),
            SheregeshPrice(liftName: "Сектор Е Ски-пасс 2 дня", cost: "4000 ₽"),
            SheregeshPrice(liftName: "Сектор Е Ски-пасс 3 дня", cost: "5800 ₽"),
            SheregeshPrice(liftName: "Сектор Е Ски-пасс 4 часа", cost: "1700 ₽"),
        ]
        return SheregeshPriceGroup(sky: price)
    }
}
