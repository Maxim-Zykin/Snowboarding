//
//  RosaKhutorTimeWork.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 19.07.2023.
//

import Foundation

public struct RosaKhutorTimeWork {
    let liftName: String
    let timeWork: String
}

public struct RosaKhutorTimeWorkGroup {
  public let sky: [RosaKhutorTimeWork]
}

extension RosaKhutorTimeWorkGroup{

    public static func skiShow() -> RosaKhutorTimeWorkGroup{

        let timeWork = [
            RosaKhutorTimeWork(liftName: "Олимпия", timeWork: "с 8:45 до 17:30"),
            RosaKhutorTimeWork(liftName: "Заповедный лес", timeWork: "с 8:55 до 17:45"),
            RosaKhutorTimeWork(liftName: "Кавказский экспресс(ниже 1600м)", timeWork: "с 9:05 до 18:00"),
            RosaKhutorTimeWork(liftName: "Кавказский Экспресс(выше 1600м)", timeWork: "с 9:05 до 18:00"),
            RosaKhutorTimeWork(liftName: "Волчья скала", timeWork: "с 9:15 до 18:00"),
            RosaKhutorTimeWork(liftName: "Крокус", timeWork: "с 10:00 до 15:30"),
            RosaKhutorTimeWork(liftName: "Стрела", timeWork: "с ноября")
        ]
        return RosaKhutorTimeWorkGroup(sky: timeWork)
    }
}
