//
//  BigWoodSkiPrice.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.03.2024.
//

import Foundation

let bigWoodInfo = ModelSkiResort(
    nameSkiResot: "БОЛЬШОЙ ВУДЪЯВР",
    allTracks: "23",
    heightDifference: "650",
    totalLengthOfTracks: "35",
    apiWeather: API.apiWeatherSheregesh,
    imageSkiR: "bigWood",
    descroption: "«Большой Вудъявр» — самый высокогорный курорт на Северо-западе России, оснащённый современными подъёмниками. Здесь вас встретят подготовленные на европейском уровне трассы, сертифицированные FIS, общей протяжённостью более 35 км, 15 из которых имеют искусственное освещение, ориентированные как на настоящих профи, так и на новичков.",
    timeWorkModel: allTimeWorkBigWood,
    costModel: allPriceBigWood,
    hotelModel: hotelsBigWoodAll,
    rentsModel: rentsBigWoodAll,
    latitudeMap: 67.602420,
    longitudeMap: 33.729756)
