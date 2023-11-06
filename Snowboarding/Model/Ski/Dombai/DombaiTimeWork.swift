//
//  DombaiTimeWork.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 20.07.2023.
//

import Foundation

public struct DombaiTimeWork {
    let liftName: String
    let timeWork: String
}

public struct DombaiTimeWorkGroup {
  public let sky: [DombaiTimeWork]
}

extension DombaiTimeWorkGroup{

    public static func skiShow() -> DombaiTimeWorkGroup{

        let timeWork = [
            DombaiTimeWork(liftName: "1-ая очередь", timeWork: "с 8:30 до 17:00"),
            DombaiTimeWork(liftName: "2-ая очередь", timeWork: "с 9:00 до 16:30")
        ]
        return DombaiTimeWorkGroup(sky: timeWork)
    }
}
