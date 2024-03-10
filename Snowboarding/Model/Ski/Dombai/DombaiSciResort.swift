//
//  DombaiSciResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.03.2024.
//

import Foundation

let dombaiInfo = ModelSkiResort(
    nameSkiResot: "ДОМБАЙ",
    allTracks: "9",
    heightDifference: "1538",
    totalLengthOfTracks: "16,2",
    apiWeather: API.apiWeatherDombai,
    imageSkiR: "dombai",
    descroption: "Горный курорт Домбай (Домбайская поляна) расположился на территории Карачаево-Черкесской республики, у подножия Главного хребта Кавказских гор. Домбай относится к всесезонному туристическому комплексу: с декабря по апрель создаются идеальные условия для активного катания по склонам, май - август - время для пешего туризма, ранняя осень - “бархатный” сезон, и только октябрь и ноябрь - сезон затишья.",
    timeWorkModel: allTimeWorkDombai,
    costModel: allPriceDombai,
    hotelModel: hotelsDombaiAll,
    rentsModel: rentsDombaiAll,
    latitudeMap: 43.290642,
    longitudeMap: 41.624346)
