//
//  SearchView.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        Spacer()
        Text("Weather")
            .font(.largeTitle)
        Spacer()
        VStack(spacing: 20) {
            Text("Enter City")
                .font(.system(size: 15, weight: .bold, design: .rounded))
            TextField("Enter city", text: $viewModel.city)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            Button("Search") {
                viewModel.search()
            }.buttonStyle(BorderedButtonStyle())
            
            if viewModel.isLoading {
                ProgressView()
            }
            if let weather = viewModel.weather {
                WeatherView(weather: weather)
            }
            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }
        }
        .padding()
        Spacer()
    }
}
