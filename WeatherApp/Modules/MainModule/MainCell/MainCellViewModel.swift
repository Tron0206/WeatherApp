//
//  WeatherCellViewModel.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 26/07/22.
//

import Foundation


protocol MainCellViewModelProtocol {
    var cityName: String { get }
    var statusDescription: String { get }
    var temperature: String { get }
}

class MainCellViewModel: MainCellViewModelProtocol {
    let weather: WeatherData
    var cityName: String {
        return weather.name ?? "No info"
    }
    var statusDescription: String {
        return weather.weather?.first?.weatherDescription ?? "No info"
    }
    
    var temperature: String {
        guard let temp = weather.main?.temp else {
            return "0"
        }
        return String(Int(temp) - 273)
    }
    
    
    init(weatherData: WeatherData) {
        weather = weatherData
    }
}
