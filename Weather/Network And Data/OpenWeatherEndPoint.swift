//
//  OpenWeatherEndPoint.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import Foundation

enum OpenWeatherEndpoint {

    case city(String)
    case coordinates(lat: Double, lon: Double)

    var url: URL {
        let apiKey = "b335487d775544ee628bba64a68c36a8"
        let base = "https://api.openweathermap.org/data/2.5/weather"

        switch self {
        case .city(let city):
            return URL(string:
                "\(base)?q=\(city)&units=metric&appid=\(apiKey)"
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            )!
            
        case .coordinates(let lat, let lon):
            return URL(string:
                "\(base)?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKey)"
            )!
        }
    }

}
 
