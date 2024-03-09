//
//  ModelSkiResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 05.03.2024.
//

import Foundation

struct ModelSkiResort {
    let nameSkiResot: String
    let allTracks: String
    let heightDifference: String
    let totalLengthOfTracks: String
    let apiWeather: String
    let imageSkiR: String
    let descroption: String
    let timeWorkModel: [AllTimeWork]
    let costModel: [AllPrice]
    let hotelModel: [AllHotels]
    let rentsModel: [AllRents]
    let latitudeMap: Double
    let longitudeMap: Double
}
