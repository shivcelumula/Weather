//
//  WeatherView.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import SwiftUI

struct WeatherView: View {
    let weather: Weather
    @State private var image: UIImage?
    var body: some View {
        VStack {
            Text(weather.city).font(.title)
            Text("\(weather.temperature, specifier: "%.1f")°C")
            Text(weather.description.capitalized)
            Text("\(weather.windSpeed, specifier: "%.2f") mph")
            if let image = image {
                Image(uiImage: image)
            }
        }
        .onAppear {
            loadIcon()
        }
    }
    
    private func loadIcon() {
        let key = weather.icon as NSString
        if let cached = ImageCache.shared.object(forKey: key) {
            image = cached
            return
        }
        let url = URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data, let img = UIImage(data: data) else { return }
            ImageCache.shared.setObject(img, forKey: key)
            DispatchQueue.main.async { image = img }
        }.resume()
    }
}
