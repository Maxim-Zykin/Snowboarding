//
//  DombaiInfoVC.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 21.09.2023.
//

import Foundation
import UIKit


let hotelKlistal = AllHotels(image: UIImage(named: "hotelKlistal")!, name: "Отель Клисталл", phone: "+7 937 740-11-01", address: "улица Карачаевская, д. 103")

let snowQueen = AllHotels(image: UIImage(named: "snowQueen")!, name: "Отель Снежная королева", phone: "+7 937 540-56-80", address: "улица Карачаевская, д. 39")

let hotelChalet = AllHotels(image: UIImage(named: "HotelChalet")!, name: "Отель Шале", phone: "+7 927 547-94-47", address: "мкр. Пихтовый мыс, ул. Тебердинская, д. 7")

let hotelMeridian = AllHotels(image: UIImage(named: "HotelMeridian")!, name: "Отель Меридиан", phone: "+7 937 740-10-80", address: "улица Карачаевская, д. 86")

let hotelOrion = AllHotels(image: UIImage(named: "HotelOrion")!, name: "Отель Орион", phone: "+7 927 060-69-70", address: "улица Карачаевская, д. 90")

let hotelGoldStar = AllHotels(image: UIImage(named: "hotelGoldStar")!, name: "Отель Gold Star", phone: "+7 928 030-55-66", address: "улица Аланская, д. 18")

var hotelsDombaiAll: [AllHotels] = [hotelKlistal, snowQueen, hotelChalet, hotelMeridian, hotelOrion, hotelGoldStar]

