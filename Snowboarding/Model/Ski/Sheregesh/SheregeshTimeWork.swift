//
//  SheregeshTimeWork.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 18.07.2023.
//

import Foundation

public struct SheregeshTimeWork {
    let liftName: String
    let timeWork: String
}

public struct SheregeshTimeWorkGroup {
  public let sky: [SheregeshTimeWork]
}

extension SheregeshTimeWorkGroup{

    public static func skiShow() -> SheregeshTimeWorkGroup{

        let timeWork = [
            SheregeshTimeWork(liftName: "«Каскад»", timeWork: "с 8:30 до 16:45"),
            SheregeshTimeWork(liftName: "«Сектор Е»", timeWork: "с 9:00 до 17:30"),
            SheregeshTimeWork(liftName: "«MALKA»", timeWork: "с 9:00 до 18:00"),
            SheregeshTimeWork(liftName: "«Фристайл»", timeWork: "с 8:30 до 16:45"),
            

        ]
        return SheregeshTimeWorkGroup(sky: timeWork)
    }
}
