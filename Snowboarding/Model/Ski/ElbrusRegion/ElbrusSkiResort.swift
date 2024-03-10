//
//  ElbrusSkiResort.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 10.03.2024.
//

import Foundation

let elbrushInfo = ModelSkiResort(
    nameSkiResot: "ПРИЭЛЬБРУСЬЕ",
    allTracks: "7",
    heightDifference: "1497",
    totalLengthOfTracks: "17",
    apiWeather: API.apiWeatherElbrusRegion,
    imageSkiR: "elb",
    descroption: "Курорт Приэльбрусье – один из самых известных на Кавказе и в России центров горнолыжного отдыха, альпинизма и туризма. Этот изумительно красивый горный край называют жемчужиной Кавказских гор. Здесь располагается самая высокая часть Кавказских гор и самые известные его вершины. Заоблачные выси здесь искрятся снегами, укрывающими вершины Эльбруса, Ушбы, Шхары, Кошкантау, Дыхтау, Уллу-Тау, Шхельды и других гор. Приэльбрусье славится также самыми мощными ледниками – Дых-Су и Безенги. Горные хребты, тянущиеся параллельно друг другу, прорезающие их грандиозные и красивейшие ущелья поражают туристов своей первозданной красотой и великолепием.",
    timeWorkModel: allTimeWorkElbrusRegion,
    costModel: allPriceElbrusRegion,
    hotelModel: hotelsElbrusRegionAll,
    rentsModel: rentsElbrusRegionAll,
    latitudeMap: 43.267222,
    longitudeMap: 42.477608)
