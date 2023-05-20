//
//  NetworkModel.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import Foundation

struct Root: Decodable {
    var main: Main = Main()
}

struct Main: Decodable {
    var temp: Double? = 0.0
    }





