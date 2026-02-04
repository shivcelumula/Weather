//
//  SearchViewModel.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
        
    @Published var city: String = ""
    @Published var weather: Weather?
    @Published var errorMessage: String?
    @Published var isLoading = false
    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol
    private let store: KeyValueStore
    
    init(weatherService: WeatherServiceProtocol,
         locationService: LocationServiceProtocol,
         store: KeyValueStore) {
        self.weatherService = weatherService
        self.locationService = locationService
        self.store = store
        loadLastCity()
        requestLocation()
    }
    
    private func loadLastCity() {
        if let lastCity = store.get(key: "lastCity") as? String, !lastCity.isEmpty {
            city = lastCity
        }
    }
    
    // Requesting location 
    private func requestLocation() {
        locationService.request { [weak self] detectedCity in
            guard let self = self, !detectedCity.isEmpty else { return }
            if city.isEmpty {
                city = detectedCity
                search()
            }
        }
    }
    
    // Search weather based on entered city. If nothing is entered search based on last entered city
    func search() {
        guard !city.isEmpty else {
            errorMessage = "Please enter a city"
            return
        }
        isLoading = true
        store.save(city, key: "lastCity")
        weatherService.fetchWeather(city: city) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let weather):
                    self?.weather = weather
                case .failure:
                    self?.errorMessage = "Unable to fetch weather"
                }
            }
        }
    }
}
