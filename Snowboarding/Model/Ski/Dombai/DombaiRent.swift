//
//  DombaiRent.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 21.09.2023.
//

import UIKit


let sunrise = AllRents(image: UIImage(named: "RentsDombai")!, name: "Sunrise", phone: "+7 928 387-31-14", address: "4-я очередь ККД")

let freeraider = AllRents(image: UIImage(named: "RentsDombai")!, name: "Freeraider", phone: "+7 928 395-78-47", address: "")

let theSnowQueen = AllRents(image: UIImage(named: "RentsDombai")!, name: "Снежная королева", phone: "+7 928 398-66-73", address: "Верхняя станция ККД 4-й очереди")

let peakIne = AllRents(image: UIImage(named: "RentsDombai")!, name: "Пик Инэ", phone: "", address: "3-я очередь ККД")

let polarBear = AllRents(image: UIImage(named: "RentsDombai")!, name: "Белый медведь", phone: "", address: "3-я очередь ККД")

let procant = AllRents(image: UIImage(named: "RentsDombai")!, name: "Прокаnt", phone: "+7 928 386-14-89", address: "4-я очередь ККД, возле гаража ратраков")

var rentsDombaiAll: [AllRents] = [sunrise, freeraider, theSnowQueen, peakIne, polarBear, procant]
