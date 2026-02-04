//
//  SearchManager.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import UIKit
import SwiftUI

final class SearchManager {
    
    func start() -> UIViewController {
        let vm = SearchViewModel(
            weatherService: WeatherService(),
            locationService: LocationService(),
            store: UserDefaultsStore()
        )
        let view = SearchView(viewModel: vm)
        return UIHostingController(rootView: view)
    }
}
 
