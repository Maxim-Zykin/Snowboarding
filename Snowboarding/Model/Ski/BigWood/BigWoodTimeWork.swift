//
//  BigWoodTimeWork.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.11.2023.
//

import Foundation

public struct BigWoodTimeWork {
    let liftName: String
    let timeWork: String
}

public struct BigWoodTimeWorkGroup {
  public let sky: [BigWoodTimeWork]
}

extension BigWoodTimeWorkGroup{

    public static func skiShow() -> BigWoodTimeWorkGroup{

        let timeWork = [
            BigWoodTimeWork(liftName: "Северный склон", timeWork: "с 10:00 до 19:00"),
            BigWoodTimeWork(liftName: "Южный склон", timeWork: "с 10:00 до 19:00"),
        ]
        return BigWoodTimeWorkGroup(sky: timeWork)
    }
}

let northernSlope = AllTimeWork(liftName: "Северный склон", timeWork: "с 10:00 до 19:00")
let southernSlope = AllTimeWork(liftName: "Южный склон", timeWork: "с 10:00 до 19:00")

let allTimeWorkBigWood = [northernSlope, southernSlope]
