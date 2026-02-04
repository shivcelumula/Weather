//
//  WeatherResponse.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [WeatherInfo]
    let wind: Wind
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct WeatherInfo: Decodable {
        let id: String
        let description: String
        let icon: String
    }
    
    struct Wind: Decodable {
        let speed: Double
    }
}
extension WeatherResponse {
    func toDomain() -> Weather {
        Weather(
            id: weather.first?.id ?? "",
            city: name,
            temperature: main.temp,
            description: weather.first?.description ?? "N/A",
            icon: weather.first?.icon ?? "",
            windSpeed: wind.speed
        )
    }
}
