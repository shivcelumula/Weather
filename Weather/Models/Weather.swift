//
//  Weather.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import Foundation

struct Weather: Codable {
    let id: String
    let city: String
    let temperature: Double
    let description: String
    let icon: String
    let windSpeed: Double
}
