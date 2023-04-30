//
//  SkiResorts.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 08.04.2023.
//

import Foundation
import UIKit

struct SkiResorts {
    let name: String
    let image: UIImage
    
    static func fetchSkiResorts() -> [SkiResorts] {
        let sheregesh = SkiResorts(name: "Шерегеш", image: UIImage(named: "sheregeshLogo")!)
        let rosaKhutor = SkiResorts(name: "Роза Хутор", image: UIImage(named: "rosakhutorLogo")!)
        let arhyz = SkiResorts(name: "Архыз", image: UIImage(named: "arhyz")!)
        let dombai = SkiResorts(name: "Домбай", image: UIImage(named: "dombai")!)
        
        return [sheregesh, rosaKhutor, arhyz, dombai]
    }
}
