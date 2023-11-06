//
//  ArhyzTimeWork.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 20.07.2023.
//

import Foundation

public struct ArhyzTimeWork {
    let liftName: String
    let timeWork: String
}

public struct ArhyzTimeWorkGroup {
  public let sky: [ArhyzTimeWork]
}

extension ArhyzTimeWorkGroup{

    public static func skiShow() -> ArhyzTimeWorkGroup{

        let timeWork = [
            ArhyzTimeWork(liftName: "Канатная дорога", timeWork: "с 8:30 до 16:30")
        ]
        return ArhyzTimeWorkGroup(sky: timeWork)
    }
}
