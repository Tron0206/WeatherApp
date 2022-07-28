//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation
import CoreLocation


class LocationManager {
    
    static func getCityCoordinate(nameCities: [String], completion: @escaping (CLLocationCoordinate2D) -> Void) {
        for city in nameCities {
            getCoordinate(nameCity: city) { coordinate in
                guard let coordinate = coordinate else { return }
                completion(coordinate)
            }
        }
    }
    
    static func getCoordinate(nameCity: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        CLGeocoder().geocodeAddressString(nameCity) { placemark, _ in
            completion(placemark?.first?.location?.coordinate ?? nil)
         }
    }
}
