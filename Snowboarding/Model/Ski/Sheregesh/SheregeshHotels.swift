//
//  SheregeshHotels.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 15.09.2023.
//

import Foundation
import UIKit

let hotelTaigara = AllHotels(image: UIImage(named: "HotelTaigara")!, name: "Отель Тайгара Сектор Е", phone: "+7 913 700-23-33", address: "Сектор Е, 3")

let greenbergHotel = AllHotels(image: UIImage(named: "greenbergHotel")!, name: "Отель Гринберг", phone: "+7 913 135‒94‒77", address: "улица Весенняя, д. 41")

let hotelJeti = AllHotels(image: UIImage(named: "hotelJeti")!, name: "Отель Йети", phone: "+7 960 901-18-87", address: "улица Снежная, д. 52")

let skyWay = AllHotels(image: UIImage(named: "SkyWay")!, name: "Отель Sky Way", phone: "8 800 600-59-05", address: "улица Олимпийская, д. 3")

let akvilon = AllHotels(image: UIImage(named: "akvilon")!, name: "Гостиница Аквилон", phone: "+7 913 436-48-40", address: "улица Спортивная, д. 25")

let grjunkhof = AllHotels(image: UIImage(named: "grjunkhof")!, name: "Гостиница Грюнхоф", phone: "+7 913 415-48-22", address: "улица Снежная, д. 19")

var hotelsSheregesh: [AllHotels] = [hotelTaigara, greenbergHotel, hotelJeti, skyWay, akvilon, grjunkhof]
