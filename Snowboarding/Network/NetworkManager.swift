//
//  NetworkManager.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 14.05.2023.
//

import Foundation

class NetworkManager {
    
    static func fetchWeather(url: String, completion: @escaping (_ fields: Main)->()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let weather = try decoder.decode(Root.self, from: data)
                completion(weather.main)
                print(weather)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
