//
//  DetailViewModel.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation

protocol DetailViewModelProtocol {
    var cityName: String? { get }
    var icon: String? { get }
    var status: String? { get }
    var temperature: String? { get }
    var pressure: String? { get }
    var windVelocity: String? { get }
    var humidity: String? { get }
}

class DetailViewModel: DetailViewModelProtocol {

    let weather: WeatherData
    
    var cityName: String? {
        return weather.name
    }
    
    var icon: String? {
        return weather.weather?.first?.icon
    }
    
    var status: String? {
        return weather.weather?.first?.weatherDescription
    }
    
    var temperature: String? {
        guard let temp = weather.main?.temp else {
            return "0"
        }
        return String(Int(temp) - 273)
    }
    
    var pressure: String? {
        guard let pressure = weather.main?.pressure else {
            return nil
        }
        return String(pressure)

    }
    
    var windVelocity: String? {
        guard let velocity = weather.wind?.speed else {
            return nil
        }
        return String(velocity)
    }
    
    var humidity: String? {
        guard let humidity = weather.main?.humidity else {
            return nil
        }
        return String(humidity)
    }
    
    
    init(weatherData: WeatherData) {
        weather = weatherData
    }
}
