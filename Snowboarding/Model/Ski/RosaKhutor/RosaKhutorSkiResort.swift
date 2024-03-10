//
//  RosaKhutorSkiResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.03.2024.
//

import Foundation

let rosaKhutorInfo = ModelSkiResort(
    nameSkiResot: "РОЗА ХУТОР",
    allTracks: "72",
    heightDifference: "1569",
    totalLengthOfTracks: "106",
    apiWeather: API.apiWeatherRosaKhutor,
    imageSkiR: "rosakhutorLogo",
    descroption: "Роза Хутор — круглогодичный горный курорт, расположенный на берегах реки Мзымта и горных склонах к югу от неё в Адлерском районе Сочи.",
    timeWorkModel: allTimeWorkRosaKhutor,
    costModel: priceRosaKhutor,
    hotelModel: hotelsRosaKhutorAll,
    rentsModel: rentsRosaKhutorAll,
    latitudeMap: 43.646468,
    longitudeMap: 40.331964)
