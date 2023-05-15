//
//  NetworkModel.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import Foundation

struct Data: Decodable {
    let values: Fields
}

struct Fields: Decodable {
    let temperature: Int
}


