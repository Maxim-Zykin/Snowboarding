//
//  RosaKhutorHotels.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 04.10.2023.
//

import Foundation
import UIKit

let greenFlow = AllHotels(image: UIImage(named: "RosaKhutorHotels")!, name: "Отель Green Flow", phone: "+7 495 565-34-44", address: "улица Сулимовка, д. 9")

let parkInnbyRadisson = AllHotels(image: UIImage(named: "ParkInnbyRadisson")!, name: "Отель Park Inn by Radisson", phone: "+7 862 243-11-11", address: "п. Эсто-Садок, улица Олимпийская, д. 35")

let azimutHotelFreestyle = AllHotels(image: UIImage(named: "AZIMUTHotel")!, name: "Отель Azimut Hotel Freestyle", phone: "+7 862 243-13-31", address: "п. Эсто-Садок, наб. Полянка, д. 4")

let radissonRosaKhutor = AllHotels(image: UIImage(named: "Radissonrosa-khutor")!, name: "Отель Radisson Rosa Khutor", phone: "+7 862 243-13-77", address: "п. Эсто-Садок, Набережная Панорама 4")

let hotelsRosaKhutorAll: [AllHotels] = [greenFlow, parkInnbyRadisson, azimutHotelFreestyle, radissonRosaKhutor]
