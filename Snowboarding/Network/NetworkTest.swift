//
//  NetworkTest.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 11.10.2023.
//

import Foundation

struct HotelsAPI {
    let name: String
    let phone: String
}

class NetworkTest {
    
    static func fetchWeather(url: String, completion: @escaping (_ fields: Main, _ icon: [Weather])->()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weather = try decoder.decode(Root.self, from: data)
                completion(weather.main, weather.weather)
                //print(weather)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
