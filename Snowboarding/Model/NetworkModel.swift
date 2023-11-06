//
//  NetworkModel.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import Foundation

struct Root: Decodable {
    var main: Main
    var weather: [Weather]
    var wind: Wind
}

struct Main: Decodable {
    var temp: Double? = 0.0
    }

struct Wind: Decodable {
    var speed: Double? = 0.0
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}


