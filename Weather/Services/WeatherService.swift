//
//  WeatherService.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//


protocol WeatherServiceProtocol {
    func fetchWeather(
        city: String,
        completion: @escaping (Result<Weather, Error>) -> Void
    )
}

final class WeatherService: WeatherServiceProtocol {
    
    func fetchWeather(
        city: String,
        completion: @escaping (Result<Weather, Error>) -> Void
    ) {
        let url = OpenWeatherEndpoint.city(city).url
        APIClient.shared.get(url: url) { (result: Result<WeatherResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
 
