//
//  LocationService.swift
//  Weather
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import CoreLocation

protocol LocationServiceProtocol {
    func request(completion: @escaping (String) -> Void)
}

final class LocationService: NSObject, LocationServiceProtocol {
    private let manager = CLLocationManager()
    private var completion: ((String) -> Void)?
    override init() {
        super.init()
        manager.delegate = self
    }
    func request(completion: @escaping (String) -> Void) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else { return }
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
            let city = placemarks?.first?.locality ?? ""
            self.completion?(city)
        }
    }
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Manual search
    }
}
