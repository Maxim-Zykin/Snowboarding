//
//  SheregeshRent.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 19.09.2023.
//

import Foundation
import UIKit


let vrent = AllRents(image: UIImage(named: "vrent")!, name: "Vаш прокат", phone: "+7 913 139‒87‒27", address: "улица Весенняя, д. 24")

let skiHouse1 = AllRents(image: UIImage(named: "SkiHouse1")!, name: "Ski House 1", phone: "+7 904 961-80-05", address: "улица Снежная, д. 40")

let skiHouse2 = AllRents(image: UIImage(named: "SkiHouse2")!, name: "Ski House 2", phone: "+7 904 961-80-07", address: "улица Снежная, д. 53в")

let skiHouse3 = AllRents(image: UIImage(named: "SkiHouse3")!, name: "Ski House 3", phone: "8 800 600-59-05", address: "улица Олимпийская, д. 3")

let startrent = AllRents(image: UIImage(named: "startrent")!, name: "Старт", phone: "8 800 500-67-51", address: "улица Весенняя, д. 21Б")

var rentsSheregeshAll: [AllRents] = [vrent, skiHouse1, skiHouse2, skiHouse3, startrent]
