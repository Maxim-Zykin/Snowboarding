//
//  ArhyzSkiResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.03.2024.
//

import Foundation

let arhyzInfo = ModelSkiResort(
    nameSkiResot: "АРХЫЗ",
    allTracks: "16",
    heightDifference: "854",
    totalLengthOfTracks: "26,8",
    apiWeather: API.apiWeatherArhyz,
    imageSkiR: "arhyz",
    descroption: "Всесезонный курорт в горах Северного Кавказа, ориентирован на активный семейный отдых. Зимой сюда едут кататься на лыжах и сноуборде, летом доступны трассы для горного велосипеда, пешие и конные маршруты, джиппинг, экскурсии по красивейшим окрестностям Архыза.",
    timeWorkModel: allTimeWorkArhyz,
    costModel: priceArhyz,
    hotelModel: hotelsArhyzAll,
    rentsModel: rentsArhyzAll,
    latitudeMap: 43.544585,
    longitudeMap: 41.181382)
